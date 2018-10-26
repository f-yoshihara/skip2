class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  before_action :check_logined, only: [:edit, :update, :destroy]
  def show
  end

  def new
    @teacher = Teacher.new
    @school  = School.new
    @schools = School.all
  end

  def edit
  end

  def create
    @teacher = Teacher.new(teacher_params)
    unless @teacher.school
      create_school
    end
    if @teacher.save
      reset_session
      session[:teacher] = @teacher.id
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to @teacher, notice: 'アカウント情報が正常に更新されました' }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to teachers_url, notice: 'アカウントは正常に削除されました' }
      format.json { head :no_content }
    end
  end

  private
    def create_school
      @school = @teacher.build_school(school_params)
      unless @school.save
        redirect_to root_path
      end
    end

    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    def check_logined
      if session[:teacher] then
        begin
          @teacher = teacher.find(session[:teacher])
        rescue ActiveRecord::RecordNotFound
          reset_session
        end
      end
      unless @teacher
        flash[:referer] = request.fullpath
        redirect_to controller: :teacher, action: :login
      end
    end

    def teacher_params
      params.require(:teacher).permit(:school_id, :name, :password, :password_confirmation, :email)
    end

    def school_params
      params.require(:school).permit(:name)
    end
end
class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  before_action :check_logined, only: [:show, :edit, :update, :destroy]
  # protect_from_forgery :except => [:create]

  def show
    @followings = @teacher.followings
  end

  def new
    @teacher = Teacher.new
    @teacher.build_school
  end

  def edit
    @schools = School.all
  end

  def create
    @teacher = Teacher.new(teacher_params)
    respond_to do |format|
      if @teacher.save
        reset_session
        session[:teacher] = @teacher.id
        format.html { redirect_to @teacher, notice: '登録が完了しました.' }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
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
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    def check_logined
      if session[:teacher] then
        begin
          @teacher = Teacher.find(session[:teacher])
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
      params.require(:teacher).permit(:name, :password, :password_confirmation, :email, school_attributes: [:name, :category])
    end
end
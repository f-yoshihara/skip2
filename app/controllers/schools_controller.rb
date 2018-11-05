class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]
  before_action :check_logined, only: [:edit, :update, :destroy]

  def index
    @schools = School.all
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to @school, notice: 'アカウント情報が正常に更新されました' }
        format.json { render :show, status: :ok, location: @school }
      else
        format.html { render :edit }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @school.destroy
    respond_to do |format|
      format.html { redirect_to schools_url, notice: 'アカウントは正常に削除されました' }
      format.json { head :no_content }
    end
  end

  private
    def set_school
      @school = School.find(params[:id])
    end

    def check_logined
      if session[:teacher]
        begin
          @teacher = Teacher.find(session[:teacher])
        rescue ActiveRecord::RecordNotFound
          reset_session
        end
      end
      unless @teacher
        flash[:referer] = request.fullpath
        redirect_to teachers_login_index_path
      end
    end

    def school_params
      params.require(:school).permit(:name, :category, :overview)
    end
end

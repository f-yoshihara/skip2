class StudentsController < ApplicationController
  before_action :check_logined, only: [:show, :index]
  before_action :set_school, only: [:index, :show]
  def index
    @students = User.where(school: @school)
  end

  def show
  end

  private
    def set_school
      @school = current_teacher.school
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
end

class Teachers::LoginController < ApplicationController
  def index
    teacher = Teacher.find_by(email: params[:email])
    if teacher && teacher.authenticate(params[:password])
      reset_session
      session[:teacher] = teacher.id
      redirect_to recruitment_list_index_path
    else
      flash.now[:referer] = params[:referer]
      @error = 'ユーザ名／パスワードが間違っています。'
      render 'index'
    end
  end
 
  def destroy
    reset_session
    redirect_to '/'
  end
end

class LoginController < ApplicationController
  def teacher_auth
    teacher = Teacher.find_by(email: params[:email])
    if teacher && teacher.authenticate(params[:password])
      reset_session
      session[:teacher] = teacher.id
      cookies.encrypted[:teacher_id] = teacher.id
      redirect_to teacher_path(teacher)
    else
      flash_reset
      render 'teacher'
    end
  end

  def staff_auth
    staff = Staff.find_by(email: params[:email])
    if staff && staff.authenticate(params[:password])
      reset_session
      session[:staff] = staff.id
      cookies.encrypted[:staff_id] = staff.id
      redirect_to staff_path(staff)
    else
      flash_reset
      render 'staff'
    end
  end

  def company_auth
    company = Company.find_by(name: params[:name])
    if company && company.authenticate(params[:password])
      reset_session
      session[:company] = company.id
      redirect_to params[:referer]
    else
      flash_reset
      render 'company'
    end
  end

  def logout
    reset_session
    cookies.delete :teacher_id
    cookies.delete :staff_id
    redirect_to '/'
  end

  private
    def flash_reset
      flash.now[:referer] = params[:referer]
      @error = 'email／パスワードが間違っています。'
    end
end
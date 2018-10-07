class StaffLoginController < ApplicationController
  #skip_before_action :check_logined

 def auth
   staff = Staff.find_by(email: params[:email])
   if staff && staff.authenticate(params[:password])
     reset_session
     session[:staff] = staff.id
     redirect_to recruitment_list_index_path
   else
     flash.now[:referer] = params[:referer]
     @error = 'ユーザ名／パスワードが間違っています。'
     render 'index'
   end
 end

 def logout
   reset_session
   redirect_to '/'
 end
end

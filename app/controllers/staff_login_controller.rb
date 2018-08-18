class StaffLoginController < ApplicationController
  #skip_before_action :check_logined

 def auth
   staff = Staff.find_by(family_name: params[:family_name])
   if staff && staff.authenticate(params[:password]) then
     reset_session
     session[:staff] = staff.id
     redirect_to params[:referer]
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

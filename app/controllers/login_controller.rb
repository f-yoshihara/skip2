class LoginController < ApplicationController
  #skip_before_action :check_logined

 def auth
  # paramsで受け取った:nameでCompanyインスタンスを作る。
   company = Company.find_by(name: params[:name])
  # companyインスタンスが作られていて、かつauthenticateできれば
   if company && company.authenticate(params[:password]) then
     #reset_session
     #セッションにcompanyの主キーを入れる。
     session[:company] = company.id
    # :refererにはflash[:referer]が入っているためnewの画面に戻れる。
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

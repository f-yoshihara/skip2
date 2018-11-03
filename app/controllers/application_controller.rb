class ApplicationController < ActionController::Base

  private
    def current_teacher
      Teacher.find(session[:teacher])
    end

    def current_staff
      Staff.find(session[:staff])
    end
end

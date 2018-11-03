class ApplicationController < ActionController::Base

  private
    def current_staff
      Staff.find(session[:staff])
    end

    def current_teacher
      Teacher.find(session[:teacher])
    end

    def current_teachers_school
      School.find(current_teacher.school_id)
    end

    def current_staffs_company
      Company.find(current_staff.company_id)
    end
end

class ApplicationController < ActionController::Base

  private
    def current_staff
      Staff.find(session[:staff])
    rescue ActiveRecord::RecordNotFound
      false
    end

    def current_teacher
      Teacher.find(session[:teacher])
    rescue ActiveRecord::RecordNotFound
      false
    end

    def current_teachers_school
      School.find(current_teacher.school_id)
    rescue NoMethodError
      false
    end

    def current_staffs_company
      Company.find(current_staff.company_id)
    rescue NoMethodError
      false
    end
end

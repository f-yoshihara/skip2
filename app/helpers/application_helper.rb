module ApplicationHelper
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
end

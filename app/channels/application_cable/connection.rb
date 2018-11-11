module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_speaker
    
    def connect
      self.current_speaker = find_verified_user
    end

    protected
    
    def find_verified_user
      if current_speaker = 
        Teacher.find_by(id: cookies.encrypted[:teacher_id]) ||
        Staff.find_by(id: cookies.encrypted[:staff_id])
        current_speaker
      else
        reject_unauthorized_connection
      end
    end
  end
end

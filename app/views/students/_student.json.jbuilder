json.extract! student, :id, :family_name, :first_name, :password_digest, :birthday, :email, :phone, :dm, :school_year, :school_name, :school_course, :created_at, :updated_at
json.url student_url(student, format: :json)

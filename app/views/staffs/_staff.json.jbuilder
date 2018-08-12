json.extract! staff, :id, :company_id, :family_name, :first_name, :password_digest, :email, :phone, :created_at, :updated_at
json.url staff_url(staff, format: :json)

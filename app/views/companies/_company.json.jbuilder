json.extract! company, :id, :name, :password_digest, :established, :url, :created_at, :updated_at
json.url company_url(company, format: :json)

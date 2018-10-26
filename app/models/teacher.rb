class Teacher < ApplicationRecord
  has_secure_password
  belongs_to :school
  validates :name,
    presence: true
  validates :password_digest,
    presence: true
  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
end

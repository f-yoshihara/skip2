class Student < ApplicationRecord
  has_secure_password
  has_many :interests
  has_many :entry_sheets
  validates :family_name,
    presence: true
  validates :first_name,
    presence: true
  validates :password_digest,
    presence: true
  validates :birthday,
    presence: true
  validates :email,
    presence: true,
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :phone,
    presence: true,
    format: { with: /\A\d{9,11}\z/ }
  validates :dm,
    presence: true
  validates :school_year,
    presence: true
  validates :school_name,
    presence: true
  validates :school_course,
    presence: true
end

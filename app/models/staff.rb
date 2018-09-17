class Staff < ApplicationRecord
  has_secure_password
  belongs_to :company
  has_many :recruitments, through: :company
  has_many :entry_sheets, through: :company
  validates :family_name,
    presence: true
  validates :first_name,
    presence: true
  validates :password_digest,
    presence: true
  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :phone,
    presence: true,
    format: { with: /\A\d{9,11}\z/ }
end

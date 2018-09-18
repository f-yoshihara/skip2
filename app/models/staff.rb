class Staff < ApplicationRecord
  has_secure_password
  belongs_to :company
  has_many :recruitments, through: :company
  has_many :entry_sheets, through: :company
  validates :name,
    presence: true
  validates :password_digest,
    presence: true
  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
end

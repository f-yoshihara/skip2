class Company < ApplicationRecord
  has_secure_password
  validates :name,
    presence: true,
    uniqueness: true
  validates :established,
    presence: true
  validates :url,
    format: /\A#{URI::regexp(%w(http https))}\z/
  has_many :staffs
  has_many :recruitments
  has_many :entry_sheets
  has_many :occupations, through: :recruitments
  has_and_belongs_to_many :industries
end

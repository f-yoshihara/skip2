class Company < ApplicationRecord
  has_many :followings
  acts_as_taggable
  acts_as_taggable_on :industries
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
end

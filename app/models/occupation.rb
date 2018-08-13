class Occupation < ApplicationRecord
  has_many :recruitments
  has_many :entry_sheets
  has_many :interests
  has_many :companies, through: :entry_sheets
  validates :category,
    presence: true
end

class Occupation < ApplicationRecord
  has_many :recruitments
  has_many :entry_sheets
  has_many :interests
  validates :category,
    presence: true
end

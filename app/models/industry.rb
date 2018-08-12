class Industry < ApplicationRecord
  has_many :interests
  has_and_belongs_to_many :companies
  validates :category,
    presence: true
end

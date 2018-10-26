class School < ApplicationRecord
  has_many :teacher
  enum category: {
    general:0,
    agricultural:1,
    industrial:2,
    commercial:3,
    fishery:4,
    home_economy:5,
    nursing:6,
    information:7,
    welfare:8,
    other:9
  }
  validates :name,
    presence: true
end

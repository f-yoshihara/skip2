class School < ApplicationRecord
  has_many :teachers
  has_many :chats
  has_many :users
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
  validates :category,
    presence: true
end

class Chat < ApplicationRecord
  belongs_to :school
  belongs_to :company
  has_many :messages
end

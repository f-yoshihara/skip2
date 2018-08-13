class Staff < ApplicationRecord
  belongs_to :company
  has_many :recruitments, through: :company
end

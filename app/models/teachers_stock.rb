class TeachersStock < ApplicationRecord
  belongs_to :teacher
  belongs_to :company
end

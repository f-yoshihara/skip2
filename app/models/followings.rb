class Following < ApplicationRecord
  belongs_to :teacher
  belongs_to :company
end

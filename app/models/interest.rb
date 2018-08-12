class Interest < ApplicationRecord
  belongs_to :student
  belongs_to :industry
  belongs_to :occupation
end

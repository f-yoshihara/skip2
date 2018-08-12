class Recruitment < ApplicationRecord
  belongs_to :company
  belongs_to :occupation
  enum status: {draft:0, published:1, deleted:2}
  validates :status,
    presence: true
end

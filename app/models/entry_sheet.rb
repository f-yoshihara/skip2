class EntrySheet < ApplicationRecord
  belongs_to :student
  belongs_to :recruitment
  belongs_to :company
  belongs_to :occupation
  has_many :staffs, through: :company
  enum status: {draft:0, published:1, deleted:2}
  validates :status,
    presence: true
  validates :why,
    presence: true,
    length: {maximum: 400}
  validates :what,
    presence: true
    length: {maximum: 400}
  validates :how,
    presence: true
    length: {maximum: 400}
end

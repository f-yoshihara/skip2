class Recruitment < ApplicationRecord
  belongs_to :company
  belongs_to :occupation
  has_many :entry_sheets
  has_many :staffs, through: :company
  enum status: {draft:0, published:1, deleted:2}
  validates :status,
    presence: true
  validates :title,
    presence: true
  validates :body,
    presence: true
  validates :deadline,
    presence: true
end

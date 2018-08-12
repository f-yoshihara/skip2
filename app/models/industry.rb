class Industry < ApplicationRecord
  has_many :interests
  has_and_belongs_to_many :companies
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

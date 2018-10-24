class EmploymentEntry < ApplicationRecord
  belongs_to :user
  belongs_to :recruitment
  validates :user_id, presence: true
  validates :recruitment_id, presence: true
  validates :answer1, presence: true
  validates :answer2, presence: true
  validates :answer3, presence: true
  validates :answer4, presence: true
  validates :answer5, presence: true
  validates :agreement, acceptance: {accept: 'yes'}
  enum status: { draft:0, published:1}
end
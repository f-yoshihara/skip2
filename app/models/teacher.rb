class Teacher < ApplicationRecord
  has_many :followings
  has_secure_password
  belongs_to :school
  accepts_nested_attributes_for :school
  validates :name,
    presence: true
  validates :password_digest,
    presence: true
  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  def can_access?(chat)
    if chat.school == self.school
      true
    else
      false
    end
  end
end

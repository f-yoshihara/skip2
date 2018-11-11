class Message < ApplicationRecord
  belongs_to :chat
  validates :content, presence: true

  def which_side?(speaker)
    if self.school && speaker.class == Teacher
      'text-right'
    elsif !self.school && speaker.class == Staff
      'text-right'
    else
      'text-left'
    end
  end
end
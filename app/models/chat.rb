class Chat < ApplicationRecord
  belongs_to :school
  belongs_to :company
  has_many :messages

  def counterparty(myparty)
    if myparty.class == School
      self.company.name
    elsif myparty.class == Company
      self.school.name
    end
  end
end

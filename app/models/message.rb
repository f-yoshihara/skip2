class Message < ApplicationRecord
  belongs_to :chat
  validates :content, presence: true

  # def html_class?(session)
  #   if self.school && session[:teacher]
  #     puts('self.school && session[:teacher]')
  #     'text-right'
  #   elsif !self.school && session[:staff]
  #     puts('!self.school && session[:staff]')
  #     'text-right'
  #   else
  #     puts(self.school.class)
  #     puts(session[:teacher].class)
  #     puts('else')
  #     'text-left'
  #   end
  # end

  def which_side?(speaker)
    if self.school && speaker.class == Teacher
      puts(speaker.class)
      puts('self.school && speaker.class == Teacher')
      'text-right'
    elsif !self.school && speaker.class == Staff
      puts(speaker.class)
      puts('!self.school && speaker.class == Staff')
      'text-right'
    else
      puts(self.school.class)
      puts(speaker.class)
      puts('else')
      'text-left'
    end
  end
end
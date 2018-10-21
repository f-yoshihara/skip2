class NoticeMailer < ApplicationMailer
  default from: 'fumiro1989@gmail.com'
  def sendmail_reply(user)
    @user = user
    mail to: user.email,
      subject: '応募企業から返事が届きました。'
  end

  def sendmail_comfirm(user)
    @user = user
    mail to: user.email,
      subject: '明日は職業体験の予定があります。'
  end
end

# Preview all emails at http://localhost:3000/rails/mailers/notice
class NoticePreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notice/sendmail_reply
  def sendmail_reply
    NoticeMailer.sendmail_reply
  end

  # Preview this email at http://localhost:3000/rails/mailers/notice/sendmail_comfirm
  def sendmail_comfirm
    NoticeMailer.sendmail_comfirm
  end

end

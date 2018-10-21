require "rails_helper"

RSpec.describe NoticeMailer, type: :mailer do
  describe "sendmail_reply" do
    let(:mail) { NoticeMailer.sendmail_reply }

    it "renders the headers" do
      expect(mail.subject).to eq("Sendmail reply")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "sendmail_comfirm" do
    let(:mail) { NoticeMailer.sendmail_comfirm }

    it "renders the headers" do
      expect(mail.subject).to eq("Sendmail comfirm")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end

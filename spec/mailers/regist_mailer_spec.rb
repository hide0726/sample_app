require "spec_helper"

describe RegistMailer do
  describe "sendmail_regist" do
    let(:mail) { RegistMailer.sendmail_regist }

    it "renders the headers" do
      mail.subject.should eq("Sendmail regist")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end

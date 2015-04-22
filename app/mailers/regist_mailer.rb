class RegistMailer < ActionMailer::Base
  default from: "noreply.sojin.portal@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.regist_mailer.sendmail_regist.subject
  #
  def sendmail_regist(user, token)
    @token = token
    mail(:to => user.email,
         :subject => "ユーザー本登録")
  end

  def sendmail_complete(user)
   @user = user
   mail(:to => user.email, 
        :subject => "ユーザー登録完了")
  end
end

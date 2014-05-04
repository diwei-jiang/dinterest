class ActivatedMailer < ActionMailer::Base
  default from: "admin@dinterest.com"
  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Dinterest, Please Activate your account")
  end
end

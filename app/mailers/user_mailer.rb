class UserMailer < ActionMailer::Base
  default from: "malveeka.bhandari@gmail.com"
 def registration_confirmation(user)
    @user = user
    mail(:to => " #{user.Email_Address}", :subject => "Registration Confirmation")
 end

 def forgot_password(user)
    @user = user
    mail(:to => " #{user.Email_Address}", :subject => "Forgot Password")
 end
end


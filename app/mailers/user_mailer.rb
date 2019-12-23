class UserMailer < ApplicationMailer

  def signup_confirmation_and_activation(user)
    @user = user
    mail from: "support@happyeats.com", to: user.email, subject: "Account activation"
  end
end

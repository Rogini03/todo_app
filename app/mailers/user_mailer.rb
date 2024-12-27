class UserMailer < ApplicationMailer
  default from: "todo@example.com"

  def new_user_email
    @user = params[:user]
    mail(to: @user.email, subject: "Welcome to My Awesome Site")
  end
end

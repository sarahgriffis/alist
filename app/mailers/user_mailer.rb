class UserMailer < ApplicationMailer
  default from: 'officialalist@alist.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://www.thealist.io/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to The Official A-List')
  end

end

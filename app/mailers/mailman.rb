class Mailman < ApplicationMailer

  def welcome_mail(user)
    @user = user
    @url = 'http://example.com/login'
    mail(to: @user.email, subject: 'What up B.')

  end
end

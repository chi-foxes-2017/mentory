class UserMailer < ApplicationMailer
    default from: 'notifications@mentory.com'

  def pairing_confirmation_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Someone signed up to pair with you!')
  end
end

class UserMailer < ActionMailer::Base
    default from: 'team.kek.dbc@gmail.com'

  def pairing_confirmation_email(mentor, pairing)
    @mentor = mentor
    @pairing = pairing
    mail(to: @mentor.email, subject: 'Someone signed up to pair with you!')
  end


end

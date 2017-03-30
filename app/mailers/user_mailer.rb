class UserMailer < ActionMailer::Base
    default from: 'team.kek.dbc@gmail.com'

  def pairing_confirmation_email(mentor, pairing)
    @mentor = mentor
    @pairing = pairing
    mail(to: @mentor.email, subject: 'Someone signed up to pair with you!')
  end

  def reschedule_request_email(pairing, request, mentor)
    @pairing = pairing
    @mentor = mentor
    @request = request
    mail(to: @mentor.email, subject: 'Your pair wants to reschedule!')
  end

end

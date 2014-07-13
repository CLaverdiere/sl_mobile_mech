class UserMailer < ActionMailer::Base
  default from: ENV['mail_email']

  def welcome_email(appointment)
    @appointment = appointment
    @url = 'http://slmobilemech.com/'
    mail(to: @appointment.email, subject: @appointment.name + ', your SL Mobile Mechanic Appointment was created!')
  end
end

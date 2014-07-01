# TODO change to correct email

class UserMailer < ActionMailer::Base
  default from: "chris@cmlaverdiere.net"
  # default from: "notifications@slmobilemechanic"

  def welcome_email(appointment)
    @appointment = appointment
    @url = 'http://slmobilemech.com/'
    mail(to: @appointment.email, subject: @appointment.name + ', your SL Mobile Mechanic Appointment was created!')
  end
end

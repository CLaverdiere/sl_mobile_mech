class AdminMailer < ActionMailer::Base
  default from: "chris@cmlaverdiere.net"
  # default from: "notifications@slmobilemechanic"

  def app_notification_email(appointment)
    @appointment = appointment
    @url = 'http://slmobilemech.com/'
    mail(to: "chris@cmlaverdiere.net", subject: "New appointment created for " + @appointment.first_name)
  end
end

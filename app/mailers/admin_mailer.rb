class AdminMailer < ActionMailer::Base
  default from: ENV['mail_email']
  # default from: "notifications@slmobilemechanic"

  def app_notification_email(appointment)
    @appointment = appointment
    @url = 'http://slmobilemech.com/'
    mail(to: ENV['mail_email'], subject: "New appointment created for " + @appointment.first_name)
  end
end

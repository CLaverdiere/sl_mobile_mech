class AdminMailer < ActionMailer::Base
  default from: ENV['mail_email']

  def app_notification_email(appointment)
    @appointment = appointment
    @url = 'http://slmobilemech.com/'
    mail(to: ENV['mail_email'], subject: "New appointment created for " + @appointment.first_name)
  end

  def review_notification_email(review)
    @review = review
    mail(to: ENV['mail_email'], subject: "New Review posted by " + @review.name)
  end

end

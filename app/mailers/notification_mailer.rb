class NotificationMailer < ApplicationMailer

  def notification_email(to)
    @match = params[:match]

    mail(to: to, subject: "Match About to Start")
  end
end

# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview
  def notification_email
    # Set up a temporary order for the preview
    order = Match.first

    NotificationMailer.with(match: order).notification_email("a@gmail.com")
  end
end

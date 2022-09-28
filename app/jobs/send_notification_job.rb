class SendNotificationJob < ApplicationJob
  queue_as :default

  def perform(*args)
    current_time = Time.zone.now.change({ min: 0, sec: 0 })

    # testing = Time.zone.now.change({hour: 16, min: 0, sec: 0 })

    UserFollowMatch.joins(:match).where('matches.date >= ?', current_time).each do |f|
      if current_time + f.hours_before_notification.hour == f.match.date.change({ min: 0, sec: 0 })
        NotificationMailer.with(match: f.match).notification_email(args[0]).deliver_now
      end

      # if testing + f.hours_before_notification.hour == f.match.date.change({ min: 0, sec: 0 })
      #   NotificationMailer.with(match: f.match).notification_email(args[0]).deliver_now
      # end
    end
  end
end

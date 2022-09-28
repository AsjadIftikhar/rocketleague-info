class RemoveTimeBeforeNotificationFromUserFollowMatch < ActiveRecord::Migration[7.0]
  def change
    remove_column :user_follow_matches, :time_before_notification, :time
  end
end

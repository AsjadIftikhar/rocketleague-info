class AddHoursBeforeNotificationToUserFollowMatch < ActiveRecord::Migration[7.0]
  def change
    add_column :user_follow_matches, :hours_before_notification, :integer
  end
end

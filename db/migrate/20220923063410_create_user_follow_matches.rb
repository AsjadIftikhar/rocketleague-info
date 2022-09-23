class CreateUserFollowMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :user_follow_matches do |t|
      t.time :time_before_notification

      t.references :match, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

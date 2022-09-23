class AddDisplayPictureRefToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :display_picture, null: true, foreign_key: true
  end
end

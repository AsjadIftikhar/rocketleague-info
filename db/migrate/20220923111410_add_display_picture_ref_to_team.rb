class AddDisplayPictureRefToTeam < ActiveRecord::Migration[7.0]
  def change
    add_reference :teams, :display_picture, null: true, foreign_key: true
  end
end

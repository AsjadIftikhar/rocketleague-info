class AddDetailsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :notification_on, :boolean
    add_column :users, :is_admin, :boolean
  end
end

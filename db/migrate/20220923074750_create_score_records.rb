class CreateScoreRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :score_records do |t|
      t.integer :goals
      t.references :player, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.references :match, null: false, foreign_key: true

      t.timestamps
    end
  end
end

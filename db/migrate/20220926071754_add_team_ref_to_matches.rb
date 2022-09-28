class AddTeamRefToMatches < ActiveRecord::Migration[7.0]
  def change
    add_reference :matches, :team_1
    add_reference :matches, :team_2

  end
end

class Match < ApplicationRecord
  belongs_to :tournament

  belongs_to :team_1, :class_name => 'Team'
  belongs_to :team_2, :class_name => 'Team'
  has_many :Teams

  has_many :user_follow_matches
  has_many :score_records
  has_many :user, through: :user_follow_matches

end

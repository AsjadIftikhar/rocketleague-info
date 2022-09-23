class Match < ApplicationRecord
  belongs_to :tournament
  has_many :user_follow_matches
  has_many :user, through: :user_follow_matches

end

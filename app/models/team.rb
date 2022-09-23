class Team < ApplicationRecord
  has_many :players
  has_many :display_pictures, as: :imageable
end

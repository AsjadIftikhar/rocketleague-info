class Team < ApplicationRecord
  has_many :players
  has_one_attached :banner
end

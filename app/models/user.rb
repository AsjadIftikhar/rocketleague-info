class User < ApplicationRecord
  has_many :user_follow_matches
  has_many :matches, through: :user_follow_matches
  has_many :display_pictures, as: :imageable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

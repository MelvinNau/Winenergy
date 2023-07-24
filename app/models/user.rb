class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :favorites
  has_many :favorited_wines, through: :favorites, source: :wine
  has_many :alerts

  enum role: {
    user: 0, 
    expert: 1, 
    admin: 2
  }
end

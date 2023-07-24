class Note < ApplicationRecord
  belongs_to :user
  belongs_to :wine

  validates :user_id, :wine_id, presence: true
  validates :balance, :intensity, :complexity, :aroma, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

  def score?
    (self.balance + self.intensity + self.complexity + self.aroma).to_f / 4
  end
end

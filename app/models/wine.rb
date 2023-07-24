class Wine < ApplicationRecord
  has_many :notes
  has_many :prices
  belongs_to :vendor, foreign_key: 'vendor_id'
  has_many :favorites
  has_many :favorited_by_users, through: :favorites, source: :user

  enum label: {
    fair_trade: 0,
    agriculture_biologique: 1,
    terra_vitis: 2,
    biodynamie: 3,
    en_conversion: 4,
    hve_3: 5
  }

  def score?
    total_score = notes.sum { |note| note.score? }
    average_score = total_score.to_f / notes.count
    average_score.nan? ? -1 : average_score
  end

  def self.all_with_notes
    joins(:notes).where.not(notes: { id: nil }).distinct
  end

  def blur_information
    Faker::Name.name
  end

  # Can be a loop to generate all the function
  def _label(fake)
    return blur_information if fake  
    label.gsub('_', ' ').capitalize
  end

  def _name(fake)
    return blur_information if fake 
    name
  end

  def _variety(fake)
    return blur_information if fake 
    variety
  end

  def _designation(fake)
    return blur_information if fake 
    designation
  end

  
end
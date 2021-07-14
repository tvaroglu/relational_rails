class Ski < ApplicationRecord
  belongs_to :ski_brand
  def self.filter_by_turn_radius(minimum)
    where('turn_radius > ?', minimum)
  end

  def self.boolean_true
    where('for_jumps = true')
  end
end
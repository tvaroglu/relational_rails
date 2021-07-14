class Park < ApplicationRecord
  has_many :trails

  def trails_count
    self.trails.length
  end

  def sort_trails_alphabetically
    self.trails.order(:name)
  end
end

class Park < ApplicationRecord
  has_many :trails

  def trails_count
    self.trails.length
  end
end

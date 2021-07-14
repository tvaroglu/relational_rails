class Trail < ApplicationRecord
  belongs_to :park

  def self.loop_trails
    Trail.where(loop: true)
  end
end

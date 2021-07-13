class Region < ApplicationRecord
  has_many :resorts

  def resort_count
    self.resorts.count
  end

  def self.ordered_by_created_date
    Region.all.order(created_at: :desc)
  end

end

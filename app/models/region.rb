class Region < ApplicationRecord
  has_many :resorts

  def self.ordered_by_created_date
    Region.all.order(created_at: :desc)
  end

  def resort_count
    self.resorts.count
  end

  def sort_resorts_alphabetically
    self.resorts.order(:name)
  end

end

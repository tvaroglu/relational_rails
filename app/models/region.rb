class Region < ApplicationRecord
  has_many :resorts

  def self.ordered_by_created_date
    Region.all.order(created_at: :desc)
  end

  def self.sorted_by_resort_count
    # Note, more conventional to place the "." at the start of new lines
    Region.select('regions.*, COUNT(resorts.id) AS resort_count')
      .joins(:resorts)
      .group('regions.id')
      .order('resort_count DESC')
  end

  def resort_count
    self.resorts.count
  end

  def sort_resorts_alphabetically
    self.resorts.order(:name)
  end

  def filter_resorts_by(x)
    self.resorts.where("ttm_revenue_usd > ?", (x.to_i * 1000000))
  end

end

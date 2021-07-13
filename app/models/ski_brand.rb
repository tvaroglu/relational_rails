class SkiBrand < ApplicationRecord
  has_many :skis

  def self.order_by_ski_count
    select('ski_brands.*, count(skis.id) AS ski_count').
    joins(:skis).
    group('ski_brands.id').
    order('ski_count desc')
  end
end
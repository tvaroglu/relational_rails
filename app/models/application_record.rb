class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.order_alphabetically(column, direction)
    order("#{column} #{direction}")
  end
end
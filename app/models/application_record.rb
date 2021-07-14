class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.order_alphabetically(column)
    order("#{column} asc")
  end
end
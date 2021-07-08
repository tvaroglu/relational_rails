class AddRegionToResorts < ActiveRecord::Migration[5.2]
  def change
    add_reference :resorts, :region, foreign_key: true
  end
end

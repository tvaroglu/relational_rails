class AddTimestampToSkiBrand < ActiveRecord::Migration[5.2]
  def change
    add_column :ski_brands, :created_at, :datetime
    add_column :ski_brands, :updated_at, :datetime
  end
end

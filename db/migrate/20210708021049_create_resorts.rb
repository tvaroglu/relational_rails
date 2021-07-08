class CreateResorts < ActiveRecord::Migration[5.2]
  def change
    create_table :resorts do |t|
      t.string :name
      t.string :country
      t.string :state_province
      t.boolean :active
      t.string :director_operations
      t.integer :ttm_revenue_usd

      t.timestamps
    end
  end
end

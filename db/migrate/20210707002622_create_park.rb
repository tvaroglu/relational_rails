class CreatePark < ActiveRecord::Migration[5.2]
  def change
    create_table :park do |t|
      t.string :name
      t.string :state
      t.string :county
      t.integer :parking_fee
      t.integer :parking_capacity
      t.boolean :dogs_allowed

      t.timestamps
    end
  end
end

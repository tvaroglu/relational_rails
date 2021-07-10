class CreateParks < ActiveRecord::Migration[5.2]
  def change
    create_table :parks do |t|
      t.string :name
      t.string :state
      t.string :county
      t.integer :parking_fee
      t.boolean :dogs_allowed

      t.timestamps
    end
  end
end

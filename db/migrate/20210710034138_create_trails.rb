class CreateTrails < ActiveRecord::Migration[5.2]
  def change
    create_table :trails do |t|
      t.string :name
      t.integer :length
      t.integer :elevation_gain
      t.boolean :loop

      t.timestamps
    end
  end
end

class CreateRegions < ActiveRecord::Migration[5.2]
  def change
    create_table :regions do |t|
      t.string :name
      t.boolean :active
      t.string :rvp_operations
      t.integer :priority

      t.timestamps
    end
  end
end

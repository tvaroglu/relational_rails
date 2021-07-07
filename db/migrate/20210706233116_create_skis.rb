class CreateSkis < ActiveRecord::Migration[5.2]
  def change
    create_table :skis do |t|
      t.string :name
      t.boolean :for_jumps
      t.float :turn_radius
      t.references :ski_brand, foreign_key: true
    end
  end
end

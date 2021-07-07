class CreateSkiBrand < ActiveRecord::Migration[5.2]
  def change
    create_table :ski_brands do |t|
      t.string :name
      t.boolean :does_racing
      t.integer :year_founded
    end
  end
end

class AddParkToTrails < ActiveRecord::Migration[5.2]
  def change
    add_reference :trails, :park, foreign_key: true
  end
end

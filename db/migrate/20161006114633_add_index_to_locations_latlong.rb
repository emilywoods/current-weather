class AddIndexToLocationsLatlong < ActiveRecord::Migration[5.0]
  def change
    add_index :locations, [:latitude, :longitude], unique: true
  end
end

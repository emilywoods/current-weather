class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.datetime :recorded_at

      t.timestamps
    end
  end
end

#Should move recorded_at to CreateCurrentWeathers

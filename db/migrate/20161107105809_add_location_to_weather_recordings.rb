class AddLocationToWeatherRecordings < ActiveRecord::Migration[5.0]
  def change
    add_column :weather_recordings , :name, :string
    add_column :weather_recordings , :latitude, :float
    add_column :weather_recordings , :longitude, :float
  end
end

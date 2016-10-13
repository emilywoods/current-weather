class AddLocationIdToWeather < ActiveRecord::Migration[5.0]
  def change
    add_column :current_weathers , :location_id, :integer
    rename_table :current_weathers , :weather_recordings
  end
end

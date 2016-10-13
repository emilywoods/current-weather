class AddRecordedatToWeatherRecordings < ActiveRecord::Migration[5.0]
  def change
    add_column :weather_recordings , :recorded_at, :datetime
  end
end

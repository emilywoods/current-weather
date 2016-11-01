require 'json'
require 'httparty'

class WeatherRecording < ApplicationRecord
  belongs_to :location

  delegate :latitude, :longitude, :name, to: :location

  attr_accessor :temp_F, :current_summary, :recording


  def update_weather
    darksky_api_key = ''

    darksky_api_url = "https://api.darksky.net/forecast/#{darksky_api_key}/#{latitude},#{longitude}"

    response = HTTParty.get(darksky_api_url)

    @weather_data = JSON.parse(response.body) if response.code ==200
  end

  def update_temperature
    self.temp_F = ((@weather_data['currently']['temperature']-32)*5/9).round(2)
  end

  def update_description
    self.current_summary = @weather_data['currently']['icon']
  end

  def update_precip
    self.precipitation = @weather_data['currently']['precipIntensity']
  end

  def update_windspeed
    self.windspeed =  @weather_data['currently']['windSpeed']
  end

  def updated_at
    self.updated_at = Time.now
  end

  def self.assign_weather(location)

    recording = WeatherRecording.new
    recording.location = location
    recording.update_weather
    recording.description = recording.update_description
    recording.temperature = recording.update_temperature
    recording.windspeed = recording.update_windspeed
    recording.precipitation = recording.update_precip
    recording

  end

  class << self
    def update_all_weather
      locations = Location.all
      locations.each do |loc|
        updated_weather = WeatherRecording.assign_weather(loc)
        updated_weather.save
      end
      WeatherRecording.all
    end
    handle_asynchronously :update_all_weather
  end

end

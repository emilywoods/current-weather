require 'json'
require 'httparty'

class CurrentWeather < ApplicationRecord
  belongs_to :location

  attr_accessor :temp_F, :current_summary

  darksky_api_key = 'b94784c3a11a7155afffa4ca04162dec'

  def initialize
    @latitude = @location.latitude
    @longitude = @location.longitude
  end

  def self.update_weather

    darksky_api_url = "https://api.darksky.net/forecast/#{@darksky_api_key}/#{@latitude},#{@longitude}"

    response = HTTParty.get(darksky_api_url)
    weather_data = JSON.parse(response.body) if response.code ==200

    self.temp_F = weather_data['currently']['temperature'] # C = (F-32)/1.8
    self.current_summary = weather_data['currently']['summary']
  end

end

#CurrentWeather.create(self.temp_F, self.current_summary)

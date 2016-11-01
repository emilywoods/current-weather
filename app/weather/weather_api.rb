require 'json'
require 'httparty'

class WeatherRecording

  attr_reader :api_key, :darksky_api_url

  def initialize()
    @darksky_api_url = 'https://api.darksky.net/forecast'
    @api_key = ''
  end

  def weather_conditions(latitude, longitude)
    response = HTTParty.get("#{@darksky_api_url}/#{@api_key}/#{latitude},#{longitude}")
    data = JSON.parse(response.body) if response.code ==200
    puts '-'*20
    puts data['timezone']
    puts data['currently']['summary']
    puts '-'*20
  end

end

weather = WeatherRecording.new.weather_conditions('51.8969', '8.4863')

require 'json'
require 'httparty'

class WeatherApi < ActiveModel::Serializer

  attr_reader :api_key, :darksky_api_url

  def initialize()
    @darksky_api_url = 'https://api.darksky.net/forecast'
    @api_key = 'b94784c3a11a7155afffa4ca04162dec'
  end

  def weather_conditions(location)
    response = HTTParty.get("#{@darksky_api_url}/#{@api_key}/#{location[:latitude]},#{location[:longitude]}")
    data = JSON.parse(response.body) if response.code ==200
    puts '-'*20
    puts data['timezone']
    puts data['currently']['summary']
    puts '-'*20
  end

  def show
    location = Location.find(params[:id])

    respond_to do |format|
      format.html {render puts data['timezone']}
      format.json {render(json: Api::V1::LocationSerializer.new(location).to_json)}
      #why not use format.json { render :json => location}??
    end
  end

end

weather = Api.new.weather_conditions('51.8969', '8.4863')

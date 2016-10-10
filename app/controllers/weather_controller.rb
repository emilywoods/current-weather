class WeatherController < ApplicationController

  def current_weather
    if params[:latitude] && params[:longitude]
      @current_weather = CurrentWeather.new(params[:latitude],params[:longitude])
    else
      #render :index
      @current_weather = CurrentWeather.new.('51.8969', '8.4863')
  end

end

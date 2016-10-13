class WeatherController < ApplicationController

  def weather_recording
    if params[:latitude] && params[:longitude]
      @weather_recording = WeatherRecording.new
      @weather_recording.location = Location.find(params[:id])
      @weather_recording.save
    else
      render :index
    end


end

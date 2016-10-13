class WeatherController < ApplicationController

  def weather_recording
    if params[:latitude] && params[:longitude]
      @weather_recording = WeatherRecording.new
      @weather_recording.location = Location.find(params[:id])
<<<<<<< ae26dcdf0151fa3fc8bb3fa661e3646db8f5de92
      @weather_recording.save
    else
      render :index
    end
=======
    else
      render :index
>>>>>>> Change new of DB to WeatherRecording from CurrentWeather. Connect weather to locations db
  end

end

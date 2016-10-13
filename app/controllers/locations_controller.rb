class LocationsController < ApplicationController

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def show
    @location = Location.find(params[:id])

    if @location.latitude && @location.longitude
<<<<<<< ae26dcdf0151fa3fc8bb3fa661e3646db8f5de92
      @weather_recording = WeatherRecording.assign_weather(@location)

    #  @weather_recording = WeatherRecording.new #new empty weather_recording
    #  @weather_recording.location = Location.find(params[:id]) #assigns location id to weather_recording
    #  @weather_recording.description = @weather_recording.update_weather
    #  @weather_recording.description = @weather_recording.update_description
    #  @weather_recording.temperature = @weather_recording.update_temperature
      @weather_recording.save 
=======
      @weather_recording = WeatherRecording.new
      @weather_recording.location = Location.find(params[:id])
      @weather_recording.update_weather

>>>>>>> Change new of DB to WeatherRecording from CurrentWeather. Connect weather to locations db
    else
      render :index
    end

  end


  def create
    @location = Location.new(location_params)
    if @location.save
      flash[:success] = "New location added!"
      render :show
    else
      render :new
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(location_params)
      flash[:success] = "Location updated!"
      redirect_to @location
    else
      render :edit
    end
  end

  def destroy
    Location.find(params[:id]).destroy
    flash[:success] = "Location deleted"
    redirect_to locations_url
  end

  def post
    @location = Location.find(params[:id])
    @slack_post = SlackPost.notify_slack
    flash[:success] = "Posted to Slack!"
  end

  private
    def location_params
      params.require(:location).permit(:name, :latitude, :longitude)
    end
end

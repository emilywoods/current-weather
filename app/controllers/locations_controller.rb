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
<<<<<<< 3b83278f0bbb383bc301b3cfc979f772417e65ad
      @weather_recording = WeatherRecording.assign_weather(@location)

    #  @weather_recording = WeatherRecording.new #new empty weather_recording
    #  @weather_recording.location = Location.find(params[:id]) #assigns location id to weather_recording
    #  @weather_recording.description = @weather_recording.update_weather
    #  @weather_recording.description = @weather_recording.update_description
    #  @weather_recording.temperature = @weather_recording.update_temperature
=======
      @weather_recording = WeatherRecording.new #new empty weather_recording
      @weather_recording.location = Location.find(params[:id]) #assigns location id to weather_recording

      @weather_recording.description = @weather_recording.update_weather
      @weather_recording.description = @weather_recording.update_description
      @weather_recording.temperature = @weather_recording.update_temperature
>>>>>>> Implement post to slack each time the weather is shown for a location
      @weather_recording.save



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
<<<<<<< db8175025c29d25b7a127303e1bab9f0e39dbd98
<<<<<<< 3b83278f0bbb383bc301b3cfc979f772417e65ad
    @location = Location.find(params[:id])
    @slack_post = SlackPost.notify_slack
=======
=======
    @location = Location.find(params[:id])

>>>>>>> Add slack integration
    @slack_post = WeatherRecording.slack_post
>>>>>>> Implement post to slack each time the weather is shown for a location
    flash[:success] = "Posted to Slack!"
  end

  private
    def location_params
      params.require(:location).permit(:name, :latitude, :longitude)
    end
end

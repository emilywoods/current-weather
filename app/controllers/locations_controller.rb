class LocationsController < ApplicationController

  def index
    @locations = Location.all

    #@weather_recording = WeatherRecording.update_all_weather
    #@weather_recording.save
    #or @weather_recording.delay = WeatherRecording.update_all_weather

  end

  def new
     @location = Location.new
  end

  def show
    @location = Location.find(params[:id])

    if @location.latitude && @location.longitude
      @weather_recording = WeatherRecording.assign_weather(@location)
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
    @location = Location.find(params[:id])
    @slack_post = SlackPost.notify_slack
    flash[:success] = "Posted to Slack!"
  end



  private
    def location_params
      params.require(:location).permit(:name, :latitude, :longitude)
    end
end

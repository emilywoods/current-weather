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
      @weather_recording = WeatherRecording.new #new empty weather_recording
      @weather_recording.location = Location.find(params[:id]) #assigns location id to weather_recording
      @weather_recording.description = @weather_recording.update_weather
      @weather_recording.description = @weather_recording.update_description
      @weather_recording.temperature = @weather_recording.update_temperature
      @weather_recording.save

      webhook_url = 'https://hooks.slack.com/services/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'
      payload = {
        text: "#{@weather_recording.description} weather in #{@location.name}. The temperature is #{@weather_recording.temperature} C."
      }
      HTTParty.post(URI.parse(webhook_url), :body => JSON.dump(payload), :headers => { 'Content-Type' => 'application/json' } )
      flash[:success] = "Posted to Slack!"

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
    @slack_post = WeatherRecording.slack_post
    flash[:success] = "Posted to Slack!"
  end

  private
    def location_params
      params.require(:location).permit(:name, :latitude, :longitude)
    end
end

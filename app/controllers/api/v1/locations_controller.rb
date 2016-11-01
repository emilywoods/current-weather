class Api::V1::LocationsController < Api::V1::BaseController

  def show
    location = Location.find(params[:id])

    respond_to do |format|
      format.html {render Api::V1::LocationDeserializer.new(location)}
      format.json {render(json: Api::V1::LocationSerializer.new(location).to_json)}
      #why not use format.json { render :json => location}??
    end
  end

  def create
    location = Location.new(location_params)
    respond_to do |format|
      if location.save
        format.json {render json: location, status: 201, location: [:api, location]}
      else
        format.json {render json: location.errors, status: 422}
      end
    end
  end

  def index
    locations = Location.all

    respond_to do |format|
      format.html { render :text => locations.html_content }
      format.json { render :json => locations }
    end
  end

  def update
    location = Location.find(params[:id])

    respond_to do |format|
      if location.edit(location_params)
        format.json {render json: location, status: 200, location: [:api, location]}
      else
        format.json {render json: location.errors, status:422}
      end
    end
  end

  def destroy
    location = Location.find(params[:id])

    respond_to do |format|
      if location.destroy
        format.json {render json: location, status: 204}
      else
        format.json {render json: location.errors, status:500}
      end
    end
  end


  def update_weather
    location = Location.find(params[:id])

    #weather_recording = WeatherRecording.new #new empty weather_recording
    #weather_recording.location = Location.find(params[:id]) #assigns location id to weather_recording

    weather_recording = WeatherRecording.assign_weather(location)
    location.name

    #weather_recording.description = weather_recording.update_weather #there must be a nicer way to do this...
    #weather_recording.name = weather_recording.name
    #weather_recording.description = weather_recording.update_description
    #weather_recording.temperature = weather_recording.update_temperature
    #weather_recording.windspeed = weather_recording.update_windspeed
    #weather_recording.precipitation = weather_recording.update_precip
    #weather_recording.updated_at = weather_recording.updated_at
    #weather_recording.created_at = location.created_at
    #weather_recording.name = weather_recording.name
    #weather_recording.latitude
    #weather_recording.longitude


    respond_to do |format|
      if location.latitude && location.longitude
        format.json {render json: weather_recording}
        format.json {render json: location}
      else
        format.json {render json: location.errors, status:400}
      end
    end

  end

  private

    def location_params
      params.require(:locations).permit(:name, :latitude, :longitude)
    end
end

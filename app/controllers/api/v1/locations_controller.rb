class Api::V1::LocationsController < Api::V1::BaseController

  def show
    location = Location.find(params[:id])

    respond_to do |format|
      format.html {render Api::V1::LocationDeserializer.new(location)}
      format.json {render(json: Api::V1::LocationSerializer.new(location).to_json)}
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
      format.html {render :text => locations.html_content}
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

  private

    def location_params
      params.require(:locations).permit(:name, :latitude, :longitude)
    end
end

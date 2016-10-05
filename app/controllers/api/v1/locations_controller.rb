class Api::V1::LocationsController < Api::V1::BaseController

  def show
    location = Location.find(params[:id])

    render(json: Api::V1::LocationSerializer.new(location).to_json)
  end

  def new
    location = Location.new(location_params)
    if location.save
      render json: location, status: 201, location: [:api, location]
    else
      render json: { errors: user.error }, status: 422
    end
  end

  def index
    locations = Location.all

    respond_to do |format|
      format.json { render :json => locations}
      format.xml { render xml: locations}
    end
  end

  def edit
    location = Location.find(params[:id])

    if location.edit(location_params)
      render json: location, status: 200, location: [:api, location]
    else
      render json: { errors: location.errors}, status:422
    end
  end

  def destroy
    location = Location.find(params[:id])

    if !location.destroy
      return api_error(status: 500)
    end

    head status: 204
  end

  private

    def location_params
      params.require(:locations).permit(:name, :latitude, :longitude)
    end


end

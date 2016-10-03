class LocationsController < ApplicationController

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def show
    @location = Location.find(params[:location])
  end

  def create
    @location = Location.new(locations_params)
    if @location.save
      redirect_to @location
    else
      render "new"
    end
  end

  private
    def location_params
      params.require(:location).permit(:name, :latitude, :longitude)
    end
end

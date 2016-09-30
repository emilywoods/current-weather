class LocationController < ApplicationController

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def show
    @location = Location.find(params[:id])
  end

  def create
    @location = Location.new(location_params)
  end

  private
    def location_params
      params.require(:location).permit(:name, :latitude, :longitude)
    end
end

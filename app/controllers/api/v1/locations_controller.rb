class Api:V1::LocationsController < Api::V1::BaseController
  respond_to :json

  def show
    respond_with Location.find(params[:id])
  end

  def index
    locations = Location.all
    locations = apply_filters(locations,params)

    render(
      json: ActiveModel::ArraySerializer.new(
      locations,
      each_serializer: Api::V1::LocationSerializer,
      root: 'locations'
      )
    )
  end
end

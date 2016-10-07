class Api::V1::BaseController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

end

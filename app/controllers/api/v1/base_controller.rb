class Api::V1::BaseController < ApplicationController

  protect_from_forgery with: :null_session
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  

  before_action :destroy_session

  def destroy_session
    request.session_options[:skip] = true
  end
end

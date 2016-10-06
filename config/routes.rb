Rails.application.routes.draw do
  root 'static_pages#home'
  get '/home',       to: 'static_pages#home'

  resources :locations

  #api
  namespace :api, :defaults => { :format => :json } do
#  namespace :api, :path => "", defaults: { format: :json }, constraints: { subdomain: 'api' }  do
    namespace :v1 do
      resources :locations, only: [:index, :new, :show, :edit, :destroy]
    end
  end


end

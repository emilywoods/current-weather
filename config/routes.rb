Rails.application.routes.draw do
  root 'static_pages#home'
  get '/home',       to: 'static_pages#home'

  resources :locations
  post 'locations/:id', to: 'locations#post', via: [:post]

  #api
  namespace :api, :defaults => { :format => :json } do
#  namespace :api, :path => "", defaults: { format: :json }, constraints: { subdomain: 'api' }  do
    namespace :v1 do
      resources :locations, only: [:index, :new, :show, :edit, :destroy]
      get '/locations/:id/update_weather' => 'locations#update_weather', via: [:update_weather]

    end
  end

end

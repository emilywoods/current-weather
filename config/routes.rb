Rails.application.routes.draw do
  get 'static_pages/home'

  resources :locations
  root 'locations#index'

end

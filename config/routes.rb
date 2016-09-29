Rails.application.routes.draw do
  root 'static_pages#home'
  get 'static_pages/home'

  resources :locations
  root 'static_pages#locations'
  get 'static_pages/locations'

end

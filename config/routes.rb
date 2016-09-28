Rails.application.routes.draw do
  root 'static_pages#home'
  get 'static_pages/home'

  resources :locations
  route 'static_pages#locations'
  get 'static_pages/locations'

end

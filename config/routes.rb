Rails.application.routes.draw do
  root 'static_pages#home'
  get 'home',       to: 'static_pages#contact'
  get '/locations', to: 'static_pages#locations'
  get  '/help',     to: 'static_pages#help'
  get 'contact',    to: 'static_pages#contact'

  resources :locations

end

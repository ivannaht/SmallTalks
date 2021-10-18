Rails.application.routes.draw do
  resources :talks
  devise_for :users
  resources :users
  root 'home#index'

end

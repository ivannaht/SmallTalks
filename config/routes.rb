Rails.application.routes.draw do
  
  resources :talks
  devise_for :users
  resources :users
  root 'home#index'
  get 'my_talks', action: :index, controller: 'my_talks'

  resources :talks, only: :index do
  member do
    post 'toggle_favorite', to: "talks#toggle_favorite"
    
  end
end
  
end

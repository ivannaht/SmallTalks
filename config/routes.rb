Rails.application.routes.draw do
  
  resources :talks
  devise_for :users
  resources :users
  root 'home#index'
  
  get 'my_talks', action: :index, controller: 'my_talks'

  resources :talks do
    resources :likes
  end
  
end

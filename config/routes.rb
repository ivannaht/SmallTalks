Rails.application.routes.draw do
  
   
  resources :talks, :shallow => true do 
    resources :comments
  end

  devise_for :users
  resources :users
  root 'home#index'
  get 'my_talks', action: :index, controller: 'my_talks'
  resources :feedbacks

  resources :talks, only: :index do
  member do
    post 'toggle_favorite', to: "talks#toggle_favorite"
  end

  member do
    patch "upvote", to: "talks#upvote"
    patch "downvote", to: "talks#downvote"
  end

end
  
end

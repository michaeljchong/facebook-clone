Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
  devise_for :users

  resources :users do
    resources :friendships
  end
  
  resources :posts do
    resources :comments
  end

  resources :comments do
    resources :likes
  end
end

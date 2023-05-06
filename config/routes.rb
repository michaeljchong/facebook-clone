Rails.application.routes.draw do
  get 'friendships/create'
  devise_for :users
  resources :comments
  resources :likes
  resources :posts
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
end

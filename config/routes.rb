Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
  devise_for :users

  resources :users, only: [:index, :show] do
    resources :friendships, only: [:create] do
      collection do
        get :confirm_request
        get :delete_request
        get :unfriend
      end
    end
    resources :notifications, only: [:index]
  end
  
  concern :likeable do
    resources :likes, only: [:create, :destroy]
  end

  resources :posts, except: [:show], shallow: true, concerns: :likeable do
    resources :comments, except: [:new, :index, :show], concerns: :likeable
  end
end

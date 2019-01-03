Rails.application.routes.draw do

  namespace :admin do
      resources :users
      resources :posts
      resources :admin_users

      root to: "users#index"
    end
  devise_for :users
  root to: 'static#homepage'

  resources :conversations do
    resources :messages
  end

  resources :posts do 
    member do 
      get :approve
    end
  end

  get 'my-listings', action: :my_posts, controller: 'posts', as: 'my_posts'
end
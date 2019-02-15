Rails.application.routes.draw do
  resources :conversations do
    resources :messages
  end

  namespace :admin do
    resources :users
    resources :posts
    resources :admin_users

    root to: "users#index"
  end

  devise_for :users
  root to: 'static#homepage'

  mount ActionCable.server => '/cable'

  resources :posts do 
    member do 
      get :approve
      get :sold
    end
  end

  get 'my-listings', action: :my_posts, controller: 'posts', as: 'my_posts'
  get 'sold-listings', action: :sold_posts, controller: 'posts', as: 'sold_posts'
end
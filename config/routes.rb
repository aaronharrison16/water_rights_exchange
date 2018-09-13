Rails.application.routes.draw do
  resources :posts

  root to: 'static#homepage'

end

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: {registration: 'users/registration'}

  # require 'sidekiq/web'
  # mount Sidekiq::Web => '/sidekiq'

  resources :teams
  resources :tournaments do
    resources :matches
  end

  resources :players

  # resources :user_follow_matches

  get '/news', to: 'application#show_news'
  get '/follow/:id', to: 'user_follow_matches#follow_match'

  # Defines the root path route ("/")
  root "home#index"
end

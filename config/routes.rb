Rails.application.routes.draw do
  resources :players
  resources :teams
  resources :user_follow_matches
  resources :matches
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :tournaments
  get '/news', to: 'application#show_news'

  # Defines the root path route ("/")
  root "home#index"
end

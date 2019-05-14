Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  root "static_pages#home"
  devise_for :users, controllers: {registrations: "registrations",
    omniauth_callbacks: "users/omniauth_callbacks"}, skip: [:sessions]
  as :user do
    get "login", to: "devise/sessions#new", as: :new_user_session
    post "login", to: "devise/sessions#create", as: :user_session
    match "logout", to: "devise/sessions#destroy", as: :destroy_user_session,
      via: Devise.mappings[:user].sign_out_via
  end

  resources :users, only: [:show, :index] do
    resources :following, :followers, only: :index
  end
  resources :words
  resources :categories, only: [:index, :show]
  resources :lessons
  resources :relationships, only: [:create, :destroy]
  resources :activities, only: :index
  resources :chatrooms do
    resource :chatroom_users
    resources :messages
  end
  resources :searches

  namespace :api do
    resources :categories, only: [:index, :show]
  end
end

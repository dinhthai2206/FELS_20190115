Rails.application.routes.draw do
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  root "static_pages#home"
  devise_for :users, controllers: {registrations: "registrations"}, skip: [:sessions]
  as :user do
    get "login", to: "devise/sessions#new", as: :new_user_session
    post "login", to: "devise/sessions#create", as: :user_session
    match "logout", to: "devise/sessions#destroy", as: :destroy_user_session,
      via: Devise.mappings[:user].sign_out_via
  end

  resources :users, only: [:show, :index] do
    resources :following, :followers, only: :index
  end
  resources :words, only: :index
  resources :categories
  resources :lessons
  resources :relationships, only: [:create, :destroy]
end

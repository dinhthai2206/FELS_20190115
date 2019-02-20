Rails.application.routes.draw do
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  get "users/show"
  root "static_pages#home"
  devise_for :users, controllers: {registrations: "registrations"}, skip: [:sessions]
  as :user do
    get "login", to: "devise/sessions#new", as: :new_user_session
    post "login", to: "devise/sessions#create", as: :user_session
    match "logout", to: "devise/sessions#destroy", as: :destroy_user_session,
      via: Devise.mappings[:user].sign_out_via
  end

  resources :users, only: :show
end

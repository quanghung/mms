Mms::Application.routes.draw do
  root "static_pages#index"
  
  resources :teams do
    resources :users
  end
  resources :sessions, only: [:new, :create, :destroy]
  
  match "/signin",  to: "sessions#new",         via: "get"
  match "/signout", to: "sessions#destroy",     via: "delete"

  namespace :admin do
    root "static_pages#index"
    resources :sessions, only: [:new, :create, :destroy]
    resources :users
    resources :positions
    match "/signin",  to: "sessions#new",        via: :get
    match "/signout", to: "sessions#destroy",    via: :delete
  end
end

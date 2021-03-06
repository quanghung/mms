Mms::Application.routes.draw do
  root "static_pages#index"
  
  resources :teams do
    resources :users
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :users

  match "/signin", to: "sessions#new", via: "get"
  match "/signout", to: "sessions#destroy", via: "delete"
  
  namespace :admin do
     root "static_pages#index"
     resources :sessions, only: [:new, :create, :destroy]
     resources :users do

     end
     resources :teams
     resources :positions
     resources :skills
     resources :projects do
        resources :project_users
     end
     match "/signin", to: "sessions#new", via: :get
     match "/signout", to: "sessions#destroy", via: :delete
  end
end
Rails.application.routes.draw do
  root :to => "users#new"
  match "logout", to: "sessions#destroy", via: [:post, :get], as: "logout"
  match "login", to: "sessions#new", via: [:get], as: "login"
  resources :users
  resources :sessions
  match "home", to: "home#show", via: [:get, :post], as: "home"
  resources :home
  match "create_board", to: "boards#new", via: [:post, :get]
  resources :boards
end

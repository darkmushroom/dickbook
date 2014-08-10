Rails.application.routes.draw do
  root :to => "users#new"
  match "logout", to: "sessions#destroy", via: [:post, :get], as: "logout"
  resources :users
  resources :sessions
  match "home", to: "home#show", via: [:get, :post], as: "home"
  resources :home
end

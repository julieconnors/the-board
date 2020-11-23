Rails.application.routes.draw do
  resources :riders
  get "register", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  post "logout", to: "session#destroy"
  resources :users, only: [:create, :show]
end

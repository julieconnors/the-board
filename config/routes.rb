Rails.application.routes.draw do
  root "welcome#home"
  get "register", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  post "logout", to: "session#destroy"
  resources :riders
  resources :owners
  resources :users, only: [:create, :show]
end

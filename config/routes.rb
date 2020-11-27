Rails.application.routes.draw do
  root "welcome#home"
  get "register", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  post "logout", to: "session#destroy"

  get "/auth/google_oauth2/callback", to: "sessions#omniauth"
  resources :riders do 
    resources :rides
  end

  resources :users

  resources :rides
  resources :horses
end

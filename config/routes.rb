Rails.application.routes.draw do
  root "welcome#home"

  get "register", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"
  get "/auth/google_oauth2/callback", to: "sessions#omniauth"

  #post "ride_by_date", to: "users#show"
  
  resources :riders
  resources :riders do 
    resources :rides, only: [:index, :new, :create]
  end
  resources :rides, only: [:show, :edit, :update, :destroy]
  resources :users
  resources :horses
end

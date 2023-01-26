Rails.application.routes.draw do
  resources :users
  get "/me", to: "users#me"
  post "/auth/login", to: "auth#login"
  
end

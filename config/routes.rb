Rails.application.routes.draw do
  resources :tree_types
  
  resources :user_trees
  resources :users

  get "/me", to: "users#me"
  post "/auth/login", to: "auth#login"
  
end

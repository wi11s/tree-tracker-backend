Rails.application.routes.draw do
  resources :friends
  resources :requests, only: [:create]
  resources :join_types

  resources :join_replies, only: [:create]
  resources :follows, only: [:create]
  resources :likes, only: [:create, :destroy]
  resources :replies, only: [:create, :destroy]
  resources :posts, only: [:index, :create, :destroy]

  resources :tree_types, only: [:create, :destroy]
  resources :user_trees
  resources :users

  get "/me", to: "users#me"
  post "/auth/login", to: "auth#login"
  get "/like/:user_id/:post_id", to: "likes#show"
  get "/like/reply/:user_id/:reply_id", to: "likes#show_for_reply"
  delete "/like/:user_id/:post_id", to: "likes#destroy_single"
  delete "/like/reply/:user_id/:reply_id", to: "likes#destroy_reply_like"
  get "/posts/replies/:post_id", to: "posts#replies"
  delete "/follows/:followed_id/:follower_id", to: "follows#destroy"
  get "/posts/:user_id", to: "posts#user_posts"
  get "/replies/:parent_reply_id", to: "replies#show_nested"
  get "/tree_types", to: "tree_types#user_tree_types"
  get "/users/filtered/:user_id", to: "users#index_with_id"
  delete "/requests/:receiver_id/:sender_id", to: "requests#destroy_by_both_ids"
  patch "/users/score/:user_id", to: "users#score_update"
  
end

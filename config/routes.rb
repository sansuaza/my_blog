Rails.application.routes.draw do

  devise_for :users
  root "articles#index"

  get '/users/show/:username', to: "users#show"
  post '/users/follow/:username', to: "users#follow"
  post '/users/unfollow/:username', to: "users#unfollow"

  resources :articles do
    resources :comments
  end
end

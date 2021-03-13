Rails.application.routes.draw do


  root "articles#index"
  devise_for :users

  get '/users/:username', to: 'users#show', as: :user
  post '/users/follow/:username', to: "users#follow", as: :follow
  post '/users/unfollow/:username', to: "users#unfollow", as: :unfollow
  resources :users

  #get '/users/show/:username', to: "users#show"
  #post '/users/follow/:username', to: "users#follow"
  #post '/users/unfollow/:username', to: "users#unfollow"

  resources :articles do
    resources :comments
  end
end

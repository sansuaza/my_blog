Rails.application.routes.draw do

  devise_for :users
  root "articles#index"

  get '/users/show/:id', to: "users#show"
  post '/users/follow/:id', to: "users#follow"

  resources :articles do
    resources :comments
  end
end

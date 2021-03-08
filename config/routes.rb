Rails.application.routes.draw do

  devise_for :users
  root "articles#index"

  get 'followees', to: "followship#followees"
  get 'unfollowees', to: "followship#unfollowees"

  resources :articles do
    resources :comments
  end
end

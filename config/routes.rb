Rails.application.routes.draw do
  get 'search/index'
  devise_for :users
  get 'home/index'
  root to: 'home#index'
  resources :users
  resources :posts
  get 'search' => 'search#index'
end

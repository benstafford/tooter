Rails.application.routes.draw do

  resource :session, only: [:new, :create]
  get "login" => "sessions#new", as: :login
  get "logout" => "sessions#destroy", as: :logout
  resources :toots, only: [:create]
  resources :users, only: [:index, :show] do
    resources :followers, only: [:index, :create, :destroy]
  end

  root 'users#index'
end

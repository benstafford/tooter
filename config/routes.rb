Rails.application.routes.draw do

  resource :session, only: [:new, :create]
  get "login" => "sessions#new", as: :login
  get "logout" => "sessions#destroy", as: :logout
  resources :toots, only: [:create]
  resources :users, only: [:index, :show, :new, :create] do
    resources :followers, only: [:index, :create, :destroy]
    resources :followings, only: [:index]
  end
  get "sign_up" => "users#new", as: :sign_up

  root 'users#index'
end

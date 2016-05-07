Rails.application.routes.draw do

  resource :session, only: [:new, :create]
  get "login" => "sessions#new", as: :login
  get "logout" => "sessions#destroy", as: :logout
  resources :toots, only: [:create] do
    resources :favorites, only: [:create]
  end
  resources :users, only: [:index, :show, :new, :create] do
    resources :followers, only: [:index, :create, :destroy]
    resources :followings, only: [:index]
  end
  get "sign_up" => "users#new", as: :sign_up

  namespace :api do
    namespace :v1 do
      resource :sessions, only: [:create]
      post "login" => "sessions#create"
      resources :toots, only: [:index]
    end
  end

  root 'users#index'
end

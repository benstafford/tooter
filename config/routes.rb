Rails.application.routes.draw do

  resource :session, only: [:new, :create]
  get "login" => "sessions#new", as: :login
  get "logout" => "sessions#destroy", as: :logout
  resources :toots

  root 'toots#index'
end

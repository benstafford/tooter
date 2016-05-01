Rails.application.routes.draw do

  resource :session, only: [:new, :create]
  get "login" => "sessions#new", as: :login
  resources :toots

  root 'toots#index'
end

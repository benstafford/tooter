Rails.application.routes.draw do

  resources :toots

  root 'toots#index'
end

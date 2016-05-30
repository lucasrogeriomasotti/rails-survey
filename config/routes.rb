Rails.application.routes.draw do
  resources :surveys
  root to: 'visitors#index'
  devise_for :users
  resources :users
end

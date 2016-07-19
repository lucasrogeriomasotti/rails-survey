Rails.application.routes.draw do
  resources :questions
  resources :surveys
  root to: 'visitors#index'
  devise_for :users
  resources :users
end

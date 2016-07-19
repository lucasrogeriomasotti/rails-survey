Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :questions
  resources :surveys
  root to: 'visitors#index'
  devise_for :users
  resources :users
end

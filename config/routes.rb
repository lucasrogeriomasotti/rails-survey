Rails.application.routes.draw do
  resources :question_types
  resources :surveys
  root to: 'visitors#index'
  devise_for :users
  resources :users
end

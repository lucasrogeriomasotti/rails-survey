Rails.application.routes.draw do
  resources :questions
  resources :surveys
  root to: 'visitors#index'
  get 'users/sign_up' => redirect('/404.html')
  devise_for :users
  resources :users
end

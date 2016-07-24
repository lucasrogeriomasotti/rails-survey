Rails.application.routes.draw do
  resources :questions, only: [:show, :edit, :destroy, :update]
  resources :surveys do
  	resources :questions
  	resources :answer_groups, only: [:new, :create]
  end
  
  root to: 'visitors#index'
  get 'users/sign_up' => redirect('/404.html')
  devise_for :users
  resources :users
end

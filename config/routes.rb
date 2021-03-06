Rails.application.routes.draw do
  resources :questions, only: [:show, :edit, :destroy, :update]
  resources :surveys do
  	resources :questions
  	resources :answer_groups, only: [:new, :create]
  end
  get 'surveys/:id/results', to: 'surveys#results', as: :survey_results
  get 'questions/:id/destroy_answers', to: 'questions#destroy_answers', as: :destroy_question_answers
  
  root to: 'visitors#index'
  get 'users/sign_up' => redirect('/404.html')
  devise_for :users
  resources :users
end

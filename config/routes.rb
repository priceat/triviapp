Rails.application.routes.draw do
  devise_for :users
  resources :questions
  resources :user_answers

  root 'questions#index'
end

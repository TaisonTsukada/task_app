Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root to: "tasks#index"
  resources :tasks
  get '/tasks/:id/assign', to: 'tasks#assign',as: :assign_task
  resources :users, only: [:show]
end

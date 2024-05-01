Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'sessions/create'

  resources :sessions, only: [:new, :create]

  get "up" => "rails/health#show", as: :rails_health_check

  get '/courses', to: redirect('/')
  resources :courses

  root "courses#index"
end

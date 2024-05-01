Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'sessions/create'

  get '/sign_out', to: 'sessions#destroy', as: :sign_out
  resources :sessions, only: [:new, :create]

  get "up" => "rails/health#show", as: :rails_health_check

  get '/courses', to: redirect('/')
  resources :courses

  root "courses#index"
end

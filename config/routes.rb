Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  get '/courses', to: redirect('/')
  resources :courses

  root "courses#index"
end

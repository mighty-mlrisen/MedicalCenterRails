Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"

  get "/error", to: "error#index"
  resources :patients
  resources :doctors
  resources :appointments
end

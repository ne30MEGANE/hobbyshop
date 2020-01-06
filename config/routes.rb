Rails.application.routes.draw do
  root "items#index"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  resources :items do
    get "search", on: :collection
  end
end

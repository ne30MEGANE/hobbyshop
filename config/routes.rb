Rails.application.routes.draw do
  root "items#index"
  resources :items do
    get "search", on: :collection
  end
end

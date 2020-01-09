Rails.application.routes.draw do
  root "items#index"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  resources :items, only: [:index, :show] do
    get "search", on: :collection
    resources :reviews, only; [:index]
  end
  resources :reviews
  resources :users
  resources :orders

  resource :session, only: [:new, :create, :destroy]
  resource :account, only: [:edit, :update]
  resource :cart, only: [:index, :update] do
    delete "delete", on: :collection
  end

  namespace :admin do
    root "items#index"
    resource :items do
      get "search", on: :collection
    end
  end
end

Rails.application.routes.draw do
  root "items#index"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  resources :items, only: [:index, :show] do
    get "search", on: :collection
    resources :reviews, only: [:index]
  end
  resources :reviews
  resources :users do
    resource :session, only: [:new, :create, :destroy]
  end
  resources :orders

  resource :account, only: [:edit, :update]
  resource :cart, only: [:index, :update] do
    delete "delete", on: :collection
  end

  namespace :admin do
    root "items#index"
    get "login" => "sessions#new"
    post "login" => "sessions#create"
    delete "logout" => "sessions#destroy"
    resources :admins do
      resource :admin_session, only: [:new, :create, :destroy]
    end
    resources :items do
      get "search", on: :collection
    end
  end
end

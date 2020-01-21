Rails.application.routes.draw do
  root "items#index"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  resources :items, only: [:index, :show] do
    get "search", on: :collection
    get "select", on: :collection
    resources :reviews, only: [:index]
  end
  resources :users, only: [:new, :create] do
    resources :reviews
    
  end

  resource :session, only: [:new, :create, :destroy]
  resource :account, only: [:edit, :update, :destroy]
  resource :password, only: [:show, :edit, :update]

  resources :carts, only: [:show]
  post '/add_item' => 'carts#add_item'
  post '/update_item' => 'carts#update_item'
  delete '/delete_item' => 'carts#delete_item'

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
      get "select", on: :collection
    end
    resources :categories
  end
end

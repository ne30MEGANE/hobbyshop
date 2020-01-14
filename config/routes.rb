Rails.application.routes.draw do
  root "items#index"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  resources :items, only: [:index, :show] do
    get "search", on: :collection
    resources :reviews, only: [:index]
  end
  resources :users, only: [:new, :create] do
    resources :reviews
    
  end

  resource :session, only: [:new, :create, :destroy]
  resource :account, only: [:edit, :update]
  resource :password, only: [:show, :edit, :update]

  resources :orders, only: [:index]
  post '/add_item' => 'orders#add_item'
  post '/update_item' => 'orders#update_item'
  delete '/delete_item' => 'orders#delete_item'

  # resource :cart, only: [:index, :update] do #orderコントローラーで実装するかも
  #   delete "delete", on: :collection
  # end

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

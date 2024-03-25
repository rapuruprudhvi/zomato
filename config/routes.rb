Rails.application.routes.draw do
  get 'cart_items/index'
  get 'cart_items/create'
  get 'cart_items/update'
  get 'cart_items/destroy'
  get 'carts/show'
  get 'places/index'
  devise_for :admin_users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :collections, only: [:show]
  resources :delivery_items
  resources :items do
    get 'rating', on: :collection
  end
  get '/veg_items', to: 'delivery_items#veg', as: 'veg_items'
  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  
  get 'show_modal', to: 'home#show_modal', as: :show_modal
  resources :restaurant_items, only: [] do
    collection do
      get 'show_restaurants'
    end
    get 'items_details', on: :collection
  end
  resources :carts, only: [:show] do
    post 'add_to_cart', on: :member
    post 'decrement_cart_quantity', on: :member
    post 'increment_cart_quantity', on: :member
  end
  
  resources :cart_items, except: [:show]
  

  resources :restaurants do
    collection do
      get 'newly_opened'
      get 'best_rated'
      get 'trending'
      get 'rooftop'
      get 'rating'
      get 'outdoor_seating'
      get 'serves_alcohol'
      get 'filters'
    end  
        post 'book', to: 'bookings#create'
        resources :reviews, only: [:create]

  end
end

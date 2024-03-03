Rails.application.routes.draw do
  get 'places/index'
  devise_for :admin_users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :collections, only: [:show]
  resources :delivery_items

  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  
  get 'show_modal', to: 'home#show_modal', as: :show_modal

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

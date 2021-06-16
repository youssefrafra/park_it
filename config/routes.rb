Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :parkings do
    member do
      patch :pause
      get :parking_bookings
    end
    resources :bookings, only: [:create, :new]
  end
  resources :bookings, only: :destroy do
    member do
      patch :decline
      patch :accept
    end
  end
  get "/my_parkings", to: "profiles#parkings"
  get "/my_bookings", to: "profiles#bookings"

end

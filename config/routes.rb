Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :parkings do
    member do
      patch :pause
    end
  end

  resources :bookings, only: [:create, :new, :destroy] do
    member do
      patch :accept
      patch :decline
    end
  end

  get "/my_parkings", to: "profiles#parkings"
  get "/my_bookings", to: "profiles#bookings"

end

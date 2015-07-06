Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: "users/registrations" }

  resources :loges, only: [:index, :show] do
    resources :bookings do
      resources :messages, only: [:create]
    end

    resources :users, only: [:show]
  end

  resource :contact, only: [:create]
end

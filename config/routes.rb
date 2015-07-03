Rails.application.routes.draw do


  get 'users/show'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :loges, only: [:index, :show] do
    resources :bookings do
      resources :messages, only: [:create]
    end
    resources :users, only: [:show]
  end


  resource :contact, only: [:create]


end

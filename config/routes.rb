Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: "users/registrations" }

  resources :loges, only: [:index, :show] do
    resources :bookings do
      resources :messages, only: [:create]
    end

    resources :users, only: [:show, :edit, :update]
  end

  patch "loges/:loge_id/bookings/:id/accept", to: "bookings#accept"
  patch "loges/:loge_id/bookings/:id/refuse", to: "bookings#refuse"
  patch "loges/:loge_id/bookings/:id/mission_done", to: "bookings#mission_done"

  resource :contact, only: [:create]
end

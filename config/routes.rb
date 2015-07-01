Rails.application.routes.draw do
  get 'contacts/create'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :loges, only: [:index, :show]
  resource :contact, only: [:create]
end

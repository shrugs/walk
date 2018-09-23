Rails.application.routes.draw do
  namespace :admin do
    resources :admin_keys
    resources :entries
    resources :locations
    resources :trips
    resources :users

    root to: "trips#index"
  end

  get '/', to: 'profile#index', as: 'profiles'
  get '/:handle', to: 'profile#show', as: 'profile'

  post '/login', to: 'login#create', as: 'login'

  get '/:handle/trip/:trip_handle', to: 'trips#show', as: 'trip'
  post '/:handle/trips', to: 'trips#create', as: 'create_trip'

  post '/:handle/trip/:trip_handle/entries', to: 'entries#create', as: 'create_entry'
end

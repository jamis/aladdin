Rails.application.routes.draw do
  resources :activities do
    member do
      get 'row'
    end
  end

  resources :residents do
    member do
      get 'row'
    end
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "residents#index"
end

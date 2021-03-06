Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :workers do
        get 'requests', on: :collection
        get 'remaining_vacation_days', on: :collection
      end
      resources :managers do
        get 'requests', on: :collection
      end
      resources :requests, only: %i[create update]
    end
  end
end

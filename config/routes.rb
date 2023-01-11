Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :subscriptions, only: [:create, :index]
      resource :subscriptions, only: [:update]
    end
  end
end

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :user_subscriptions
      resources :subscriptions
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

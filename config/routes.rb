Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    resources :users, only: [:create, :show]
    resource :session, only: [:create, :destroy]
    resources :api_usages, only: [:index]
    resources :utilities, only: [:index]
    resources :subscriptions, only: [:index]
  end

  root "static_pages#root"
end

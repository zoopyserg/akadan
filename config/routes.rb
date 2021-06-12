Rails.application.routes.draw do
  resources :dots
  devise_for :users
  get "/pages/*id" => 'pages#show', as: :page, format: false

  resources :record_types

  resources :connections
  resources :connection_types

  resources :conversations do
    resources :messages
    resources :participations
  end

  resources :users
  resources :seminars
  resources :events
  resources :notifications
  resources :sensors
  resources :people
  resources :friend_requests
  resources :blocked_users
  resources :friends

  resources :records do
    resources :connection_types do
      resources :connections
    end
  end

  root to: "records#index"
end

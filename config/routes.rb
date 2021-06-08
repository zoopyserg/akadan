Rails.application.routes.draw do
  devise_for :users
  get "/pages/*id" => 'pages#show', as: :page, format: false

  resources :record_types
  resources :connection_types
  resources :connections

  resources :conversations do
    resources :messages
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
  resources :records

  root to: "records#index"
end

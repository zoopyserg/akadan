Rails.application.routes.draw do
  resources :conversations
  devise_for :users
  resources :users
  resources :seminars
  resources :events
  resources :notifications
  resources :sensors
  resources :people
  resources :messages
  resources :message_chains
  resources :friend_requests
  resources :blocked_users
  resources :friends
  resources :connections
  resources :connection_types
  resources :record_types
  get "/pages/*id" => 'pages#show', as: :page, format: false
  resources :records
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "records#index"
end

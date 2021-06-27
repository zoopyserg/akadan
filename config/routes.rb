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

  resources :users, only: [:show, :edit]
  resources :seminars
  resources :events
  resources :notifications
  resources :sensors
  resources :people, only: :index do
    resources :conversation_starts, only: :create
  end
  resources :blocked_users, only: :index do
    resources :blockings, only: [:create, :destroy]
  end
  resources :friends, only: :index do
    resources :friend_requests, only: [:create] do
      collection do
        delete :reject, as: :reject
        delete :unfriend, as: :unfriend
      end
    end
  end

  resources :records do
    resources :connection_types do
      resources :connections
    end
  end

  root to: "records#index"
end

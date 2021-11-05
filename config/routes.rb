require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"

  devise_for :users
  get "/pages/*id" => 'pages#show', as: :page, format: false

  resources :record_types, except: [:destroy]
  resources :connections, only: [:index, :show]
  resources :connection_types, except: [:destroy]

  resources :conversations, only: [:index, :show, :new, :create] do
    resources :messages, only: [:index, :create]
    resources :participations, only: [:index, :new, :create, :destroy]
  end

  resources :users, only: [:show, :edit, :update]
  resources :seminars
  # resources :events
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
        post :accept, as: :accept
        delete :reject, as: :reject
        delete :unfriend, as: :unfriend
      end
    end
  end

  resources :records, except: [:destroy] do
    # collection do
    #   get :only_solved
    #   get :only_unsolved
    #   get 'only_record_type/*record_type_id' => 'records#only_record_type', as: :only_record_type
    # end

    resources :dots, only: [:new, :create] # maybe do Index too. 'cause it's a scaffold baby
    resources :bookmarks, only: [:create, :destroy]
    resources :connection_types do
      resources :connections, only: [:new, :edit, :create, :update] do
        collection do
          post :into_separate_project
        end
      end
      resources :record_types, only: [] do
        resources :bulk_records, only: [:new, :create]
      end
    end
  end

  root to: "records#index"
end

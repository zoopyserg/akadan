require 'sidekiq/web'

Rails.application.routes.draw do
  resources :groups, only: [:edit, :update]
  mount Sidekiq::Web => "/sidekiq"

  devise_for :users
  get "/pages/*id" => 'pages#show', as: :page, format: false

  resources :record_types, except: [:destroy, :show]
  resources :connections, only: [:index]
  resources :connection_types, except: [:show, :destroy]

  resources :conversations, only: [:index, :show, :new, :create] do
    resources :messages, only: [:index, :create]
    resources :participations, only: [:index, :new, :create, :destroy]
  end

  resources :users, only: [:show, :edit, :update]
  resources :seminars
  # resources :events
  resources :notifications
  resources :sensors

  resources :desires, only: [:create]
  resources :designs, only: [:create, :update]

  resources :people, only: :index do
    resources :conversation_starts, only: :create
  end

  resources :blocked_users, only: :index do
    resources :blockings, only: [:create, :destroy]
  end

  resources :friends, only: :index do
    resources :friend_requests, only: [:create] do
      collection do
        get :accept, as: :accept # post
        get :reject, as: :reject # delete
        get :unfriend, as: :unfriend # delete
      end
    end
  end

  resources :comments, only: [] do
    resources :comments, only: [:new, :create]
    resources :votes, only: [:create]
  end

  resources :records, except: [:destroy] do
    # collection do
    #   get :only_solved
    #   get :only_unsolved
    #   get 'only_record_type/*record_type_id' => 'records#only_record_type', as: :only_record_type
    # end

    resources :comments, only: [:new, :create]

    resources :dots, only: [:new, :create] # maybe do Index too. 'cause it's a scaffold baby
    resources :bookmarks, only: [] do
      collection do
        get :create_bookmark
      end
      member do
        get :destroy_bookmark
      end
    end
    resources :connection_types, except: [:destroy] do
      resources :connections, only: [:new, :edit, :create, :update] do
        collection do
          get :into_separate_project # post
        end
      end
      resources :record_types, only: [] do
        resources :bulk_records, only: [:new, :create]
      end
    end
  end

  root to: "records#index"
end

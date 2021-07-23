Rails.application.routes.draw do
  devise_for :users
  get "/pages/*id" => 'pages#show', as: :page, format: false

  resources :record_types, except: [:destroy]
  resources :connections, except: [:destroy]
  resources :connection_types, except: [:destroy]

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
        post :send, as: :send
        post :accept, as: :accept
        delete :reject, as: :reject
        delete :unfriend, as: :unfriend
      end
    end
  end

  resources :records do
    resources :dots, only: [:new, :create]
    resources :bookmarks, only: [:create, :destroy]
    resources :connection_types do
      resources :connections do
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

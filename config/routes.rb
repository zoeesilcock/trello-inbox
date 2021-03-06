Rails.application.routes.draw do
  root to: 'visitors#index'

  resources :inboxes, except: [:index], param: :inbox_id do
    member do
      resources :ideas do
        member do
          resources :comments, only: [:create]
        end
      end
      resources :fields, only: [:create, :update, :destroy]
      put 'order_fields' => 'fields#update_order'
    end
  end

  resources :users, only: [:index, :update]

  get '/trello-callbacks/:type/:id' => 'trello_callbacks#imhere'
  post '/trello-callbacks/:type/:id' => 'trello_callbacks#webhook',
    as: :trello_callback

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end

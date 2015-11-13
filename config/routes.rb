Rails.application.routes.draw do
  root to: 'visitors#index'

  resources :inboxes, param: :inbox_id do
    member do
      resources :ideas
    end
  end

  resources :users, only: [:index]

  post '/trello-callbacks/:type/:id' => 'trello_callbacks#webhook',
    as: :trello_callback

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end

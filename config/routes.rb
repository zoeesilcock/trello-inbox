Rails.application.routes.draw do
  get 'ideas/new'

  root to: 'visitors#index'

  resources :inboxes

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end

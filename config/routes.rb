Rails.application.routes.draw do
  root to: 'bookmarks#index'
  match '/auth/:provider/callback', to: 'sessions#facebook_login', via: [:get, :post]
  get '/auth/facebook/callback', to: 'sessions#omniauth'
  #get '/auth/github/callback', to: 'sessions#create'
  #get '/auth/twitter/callback', to: 'sessions#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :bookmarks
  resources :tags
  resources :sessions
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

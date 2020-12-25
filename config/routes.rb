Rails.application.routes.draw do
  root to: 'bookmarks#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/singup', to: 'users#new'
  post '/singup', to: 'users#create'
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  #get '/auth/github/callback', to: 'sessions#create'
  #get '/auth/facebook/callback', to: 'sessions#create'
  #get '/auth/twitter/callback', to: 'sessions#create'


  #resources :sessions
  resources :tags
  resources :bookmarks
  #resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

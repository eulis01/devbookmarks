Rails.application.routes.draw do
  root to: 'bookmarks#home'
  
  get '/auth/github/callback', to: 'sessions#create'
  get '/auth/facebook/callback', to: 'sessions#create'
  get '/auth/twitter/callback', to: 'sessions#create'


  resources :sessions
  resources :tags
  resources :bookmarks
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

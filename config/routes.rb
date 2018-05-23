Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  root 'welcome#index'
  get 'welcome/index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :breweries, only: [:index, :show]
  resources :beers, only: [:index, :show]
  resources :users, only: [:show, :new, :create]
  namespace :admin do
    resources :categories, only: [:index]
    resources :breweries
    resources :users
    resources :beers
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

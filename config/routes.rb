Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'users/new'
  get 'user/new'
  root 'welcome#index'
  get 'welcome/index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :breweries
  resources :beers
  resources :users
  namespace :admin do
    resources :categories, only: [:index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

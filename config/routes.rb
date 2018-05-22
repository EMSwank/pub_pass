Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'users/new'
  get 'user/new'
  root 'welcome#index'
  get 'welcome/index'
  get '/login', to: 'sessions#new'

  resources :breweries
  resources :beers
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

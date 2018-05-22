Rails.application.routes.draw do
  get 'user/new'
  root 'welcome#index'
  get 'welcome/index'

  resources :breweries
  resources :beers
  resources :users, only: [:new]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

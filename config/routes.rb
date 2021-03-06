Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :index]
  get '/register', to: "users#new"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/admin', to: 'admin/base#index'

  resources :categories, only: [:show, :index]
  resources :gifs, only: [:show, :update]
  resources :favorites, only: [:destroy]

  namespace :admin do
    resources :categories, :gifs
  end
end

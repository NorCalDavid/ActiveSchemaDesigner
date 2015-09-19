Rails.application.routes.draw do

  resources :users

  resources :projects do
    resources :tables do
      resources :fields
    end
  end

  get 'sessions/create' => 'sessions#create'
  get 'sessions/destroy' => 'sessions#destroy'
  get '/login' =>  'sessions#new'
  post '/login' =>  'sessions#create'
  get '/logout' => 'sessions#destroy'

  root 'welcome#index'

  end

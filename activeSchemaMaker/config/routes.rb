Rails.application.routes.draw do

  resources :projects do
    resources :tables do
      resources :fields
    end
  end

  get 'sessions/create' => 'sessions#create'
  get 'sessions/destroy' => 'sessions#destroy'

  root 'welcome#index'

  end

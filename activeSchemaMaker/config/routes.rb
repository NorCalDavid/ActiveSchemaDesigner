Rails.application.routes.draw do

  resources :users, only: [:new, :create, :edit, :update, :show]

  resources :projects

  post '/create_relationships' => 'projects#create_relationships'

  resources :tables do
    resources :fields
  end

  resources :relationships, only: [:show, :create, :destroy]

  get '/login' =>  'sessions#new'
  post '/login' =>  'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  get '/test' => 'welcome#test'
  root 'sessions#new'

end

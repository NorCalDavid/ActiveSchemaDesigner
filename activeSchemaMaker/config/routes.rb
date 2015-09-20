Rails.application.routes.draw do

  resources :users

  resources :projects

  resources :tables do
    resources :fields
  end


  get '/login' =>  'sessions#new'
  post '/login' =>  'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  root 'sessions#new'

end

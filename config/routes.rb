Rails.application.routes.draw do

  resources :users, only: [:new, :create, :edit, :update, :show]

  resources :projects do
    member do
      get :migration
      get :project_control
    end
  end

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


  # possibly better routing::
  #
  # resources :projects do
  #   resources :tables, only: [:index, :new, :create]
  # end
  # resources :tables, except: [:index, :new, :create] do
  #   resources :fields, only: [:index, :new, :create]
  # end
  # resources :fields, except: [:index, :new, :create]

end



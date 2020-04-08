Rails.application.routes.draw do

  root 'sessions#home'

  get '/register' => 'clients#new'
  post 'register' => 'clients#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :treatments

  resources :clients do 
    resources :appointments, only: [:show, :index]
  end 

  resources :appointments
  
  # resources :clients, only: [:show] do 
  #   resources :appointments, only: [:show, :index]
  # end 
  # resources :appointments, only: [:index, :show, :new, :create, :edit, :update]
  # root 'appointments#index'
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do

  resources :appointments
  resources :treatments
  root 'sessions#home'

  get '/register' => 'clients#new'
  post 'register' => 'clients#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :clients
  resources :treatments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

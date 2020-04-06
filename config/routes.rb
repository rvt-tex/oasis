Rails.application.routes.draw do

  root 'sessions#home'

  get '/register' => 'clients#new'
  post 'register' => 'clients#create'





  resources :clients
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

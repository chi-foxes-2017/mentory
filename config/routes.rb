Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  root 'splage#index'

  resources :pairings

  # resources :users do
  #   resources :pairings
  # end
  
  get '/pairings' => 'pairings#index'

end

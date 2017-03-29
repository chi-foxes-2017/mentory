Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  root 'splage#index'

  resources :users do
    resources :pairings
  end

end

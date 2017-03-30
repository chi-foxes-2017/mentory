Rails.application.routes.draw do
  # resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create, :show] do
    resources :pairings
  end
  root 'pairings#index'
end

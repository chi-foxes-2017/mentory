Rails.application.routes.draw do
  root 'splage#index'

  # resources :users do
  #   resources :pairings
  # end

  get '/pairings' => 'pairings#index'

end

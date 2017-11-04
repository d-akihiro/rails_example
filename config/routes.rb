Rails.application.routes.draw do
  root 'static_pages#home'
  #get '/users/:id', to: 'users#show'

  resources :users, only: [:new, :show, :create]
end

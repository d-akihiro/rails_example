Rails.application.routes.draw do
  get 'sessions/new'

  root 'static_pages#home'
  #get '/users/:id', to: 'users#show'

  resources :users, only: [:new, :show, :create]

  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'
end

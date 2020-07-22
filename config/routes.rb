Rails.application.routes.draw do
  resources :breweries
  resources :brewery_favorites, only: [:create, :delete]
  resources :brewery_likes, only: [:create, :delete]
  resources :brewery_reviews

  resources :circuits
  resources :circuit_favorites, only: [:create, :delete]
  resources :circuit_likes, only: [:create, :delete]
  resources :circuit_reviews

  resources :follows, only: [:create, :delete]

  resources :notifications, except: [:update]

  resources :users
  post '/log-in', to: 'users#log_in'
  post '/auto_log_in', to: 'users#auto_log_in'
  delete '/log-out', to: 'users#log_out'
  get '/users/:id/edit', to: 'users#edit'

end

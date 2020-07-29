Rails.application.routes.draw do
  resources :breweries, only: [:index, :show]
  get '/breweries/index-form', to: 'breweries#index_form'
  resources :brewery_favorites, only: [:create, :destroy]
  resources :brewery_likes, only: [:create, :destroy]
  resources :brewery_reviews, except: [:index]

  resources :circuits
  resources :circuit_favorites, only: [:create, :destroy]
  resources :circuit_likes, only: [:create, :destroy]
  resources :circuit_reviews, except: [:index]

  resources :follows, only: [:create, :destroy]

  resources :notifications

  resources :users
  post '/log_in', to: 'users#log_in'
  post '/auto_log_in', to: 'users#auto_log_in'
  delete '/log-_out', to: 'users#log_out'
  get '/users/:id/edit', to: 'users#edit'

end

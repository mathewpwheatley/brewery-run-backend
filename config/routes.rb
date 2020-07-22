Rails.application.routes.draw do
  resources :breweries, except: [:new, :edit]
  resources :brewery_favorites, only: [:create, :delete]
  resources :brewery_likes, only: [:create, :delete]
  resources :brewery_reviews, except: [:new, :edit]

  resources :circuits, except: [:new, :edit]
  resources :circuit_favorites, only: [:create, :delete]
  resources :circuit_likes, only: [:create, :delete]
  resources :circuit_reviews, except: [:new, :edit]

  resources :follows, only: [:create, :delete]

  resources :notifications, except: [:new, :edit]

  resources :users, except: [:new, :edit]
  post '/log-in', to: 'users#log_in'
  post '/auto_log_in', to: 'users#auto_log_in'
  delete '/log-out', to: 'users#log_out'

end

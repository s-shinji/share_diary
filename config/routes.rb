Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  get 'likes/create'
  get 'likes/destroy'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root "top#index"
  post '/top/guest_sign_in', to: 'top#new_guest'
  resources :users, only: [:show] 
  resources :relationships, only: [:create, :destroy]

  resources :topics,  except: [:show, :destroy]  do 
    resources :favorites, only: [:create, :destroy]
    resources :tweets do
      resources :users, only: [:show] 
      resources :likes, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
  end
end

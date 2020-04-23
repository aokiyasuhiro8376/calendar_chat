Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#index'
  # root to: 'rooms#index'
  # root to: "chats#index"
  # get 'rooms/show'
  # get 'users/index'
  # get 'users/show'
  resources :users
  # resources :rooms
  resources :chats
  # resources :rooms, only: %i[show]

end

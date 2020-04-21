Rails.application.routes.draw do
  root to: "chats#index"
  get 'rooms/show'
  get 'users/index'
  get 'users/show'
  devise_for :users
  resources :users
  resources :rooms
  resources :chats

end

Rails.application.routes.draw do
  # rootはRoom一覧画面にしておく
  root 'rooms#index'
  devise_for :user
  # resourcesを使うとRESTfulなURLを自動生成できる
  # resources :rooms, only: :show
  resources :chats
  
  # root to: "chats#index"
  # get 'rooms/show'
  # get 'users/index'
  # get 'users/show'
  resources :users
  resources :rooms
end

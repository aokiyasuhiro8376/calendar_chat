Rails.application.routes.draw do
  devise_for :user
  resources :users
  resources :rooms
  # rootはRoom一覧画面にしておく
  root 'rooms#index'
  # resourcesを使うとRESTfulなURLを自動生成できる
  resources :chats
end

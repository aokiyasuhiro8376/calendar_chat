Rails.application.routes.draw do
  devise_for :user
  # rootはRoom一覧画面にしておく
  root 'rooms#index'
  # resourcesを使うとRESTfulなURLを自動生成できる
  resources :rooms do
    resources :chats
  end
  resources :users
end

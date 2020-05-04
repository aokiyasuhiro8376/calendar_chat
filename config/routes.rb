Rails.application.routes.draw do
  root 'rooms#index'

  devise_for :user
#   resources :users
#   resources :rooms
#   # rootはRoom一覧画面にしておく
  # root 'rooms#index'
#   # resourcesを使うとRESTfulなURLを自動生成できる
#   resources :chats
# end

#   root "rooms#index"
#   devise_for :users,
#     # get '/signup', to: 'users/registrations#index'
#     # # get '/signup/registration', to: 'users/registrations#new'
#     # # post '/signup/registration', to: 'users/registrations#create'
#     # get '/signup/registration/:id', to: 'users/registrations#show'
  

#   # メイン画面、商品詳細画面
#   get '/', to: 'rooms#index'
#   get '/:id/show', to: 'rooms#show'
#   # , as: 'main_show'

#   # マイページトップページ、本人情報登録画面
#   get '/users', to: 'users#index'
#   get '/users/edit', to: 'users#edit'
#   patch '/users/update', to: 'users#update'

#   # 発送元・お届け先住所画面
#   # 登録画面が不明のため、適当に/registを付けています
#   get '/chats/new', to: 'chats#new'
#   post '/chats/show', to: 'chats#show'
#   get '/chats/edit', to: 'chats#edit'
#   patch '/chats/update', to: 'chats#update'
# end
end

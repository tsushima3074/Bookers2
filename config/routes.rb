Rails.application.routes.draw do
  devise_for :users
  # root_pathの設定
  root :to => 'homes#index'

  get '/home/about' => 'homes#about'

  # booksのルーティング設定
  resources :books

  resources :users
end

Rails.application.routes.draw do
  devise_for :users
  # root_pathの設定
  root :to => 'homes#index'

  get '/home/about' => 'homes#about'

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  resources :users
end

Rails.application.routes.draw do
  
  
  # ルートパス
  root to: "main#index"
  # user
  resources :users

  # ルーティーン記事投稿
  resources :post_routines
  get 'post_routines/confirm', to: 'post_routines#confirm'

  # routeの基本構文
  #(get or post or patch or delete) 'URL', to: 'コントローラー名#メソッド名'
end

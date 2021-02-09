Rails.application.routes.draw do

  # ルートパス
  root to: "main#index"
  # user
  resources :users
  # routine
  get 'routines/confirm', to: 'routines#confirm'
  resources :routines
  
  # routeの基本構文
  #(get or post or patch or delete) 'URL', to: 'コントローラー名#メソッド名'
end
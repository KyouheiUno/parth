Rails.application.routes.draw do

  # ルートパス
  root to: "main#index"

  # user
  resources :users

  # routine
  get 'routines/confirm', to: 'routines#confirm'
  resources :routines

  # login
  get 'login/sign_in', to: 'login#sign_in' #login_sign_in_path
  delete 'login/sign_out', to: 'login#sign_out' #login_sign_out_path
  post 'login/sign_in_check', to: 'login#sign_in_check' #login_sign_in_check_path


  # routeの基本構文
  #(get or post or patch or delete) 'URL', to: 'コントローラー名#メソッド名'
end
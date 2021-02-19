Rails.application.routes.draw do

  #ルートパス
  root to: "main#index"

  #ユーザー
  resources :users

  #管理者ページ
  namespace :admin do
    resources :users do
      collection do
        delete 'destroy_all'
      end
      member do 
        post 'open_flag_change'
      end
    end
    resources :professions, only: [:index, :create, :update, :destroy]
  end

  #ルーティーン
  resources :routines do
    collection do
      get "confirm"       
    end
  end

  #サインイン（ログイン）
  get 'login/sign_in', to: 'login#sign_in' #login_sign_in_path
  delete 'login/sign_out', to: 'login#sign_out' #login_sign_out_path
  post 'login/sign_in_check', to: 'login#sign_in_check' #login_sign_in_check_path

  #管理画面側
  resources :admin do
    
  end

  # routeの基本構文
  #(get or post or patch or delete) 'URL', to: 'コントローラー名#メソッド名'
  # onlyを使用した形
  # resources :users, only: [:index, :show]
end
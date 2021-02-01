Rails.application.routes.draw do
  
  # user
  get 'users/index'
  get 'users/show'
  # ルート
  root to: "main#index"

end

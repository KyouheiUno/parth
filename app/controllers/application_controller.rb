class ApplicationController < ActionController::Base
  before_action :get_signed_user_data

  #サインインしているユーザー情報を取得する
  def get_signed_user_data
    @current_user_id = cookies.signed[:id]
    @current_user_email = cookies.signed[:email]
    @current_user_obj = User.find_by(id: @current_user_id)
    @current_user_signed = current_user_sign_in?(
      @current_user_id,
      @current_user_email,
      @current_user_obj
    )
  end

  private 

  #cookieにidとemailが存在しかつUserモデルから対象のレコードが存在する場合サインイン中と判定する
  def current_user_sign_in?(id, email, object)
    @result_bool = false
    unless (id.blank?) && (email.blank?) && (object.blank?)
      @result_bool = true
    end
    return @result_bool
  end

  #サインインしていない時はリダイレクト
  def require_signed
    redirect_to root_path unless @current_user_signed
  end
end
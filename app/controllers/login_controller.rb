class LoginController < ApplicationController
    before_action :get_signed_user_data
    before_action :redirect_root, except: :sign_out
    
    #サインイン画面(メールアドレス入力)
    def sign_in
        @check = cookies[:email]
        unless @check.blank?
            flash[:notice] = "すでにサインインしているようです。"
            redirect_to root_path
        end
    end

    #サインイン画面(入力値確認)
    def sign_in_check
        @email = params[:email]
        @password = params[:password]
        @email_result = sign_in_email_check?(@email)
        @password_result = sign_in_password_check?(@email, @password)
        
        if @email_result && @password_result
            sign_in_success(@email)
        else
            flash[:warning] = "メールアドレスとパスワードが一致するアカウントがありません"
        end
        redirect_to root_path
    end

    #サインアウト画面
    def sign_out
        delete_cookie_login_date(cookies[:email])
        flash[:success] = "サインアウトしました。"
        redirect_to root_path
    end

    private

    #サインイン成功時の処理
    def sign_in_success(email)
        add_cookie_login_date(email)
        flash[:success] = "サインインしました。"
    end

    #ユーザー情報確認(メールアドレス)
    def sign_in_email_check?(email)
        return User.exists?(email: email)
    end

    #ユーザー情報確認(パスワード)
    def sign_in_password_check?(email, password)
        @check_result = false
        @user_date_1 = User.find_by(email: email)
        unless @user_date_1.blank?
            @user_date_2 = @user_date_1.authenticate(password)
            if (@user_date_1.blank?) or (@user_date_2 == false)
                @check_result = false
            else @user_date_1.email === @user_date_2.email
                @check_result = true
            end
        end
        return @check_result
    end

    #サインイン情報をcookieに保存する
    def add_cookie_login_date(email)
        @user = User.find_by(email: email)
        cookies.signed[:email] = email
        cookies.signed[:id] = @user.get_from_email_to_id(email)
    end

    #cookieのサインイン情報を削除する
    def delete_cookie_login_date(email)
        cookies.delete :email
        cookies.delete :id
    end

    #before_actionメソッド
    #[WIP]サインインしており、サインアウト以外のメソッドを実行する場合はリダイレクト
    def redirect_root
        # redirect_to root_path if LoginHelper.user_signed?
    end
end
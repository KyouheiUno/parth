class MainController < ApplicationController

    #サインインしているユーザーのデータを取得する
    before_action :get_signed_user_data

    def index
        @user_email = cookies.signed[:email]
        @user_id = cookies.signed[:id]
    end

    def edit
    end



















end
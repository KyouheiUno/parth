class UsersController < ApplicationController

  before_action :require_signed, expect: [:index]
  before_action :get_user_from_id, only: [:show, :edit, :update]
  
  def index
    @users = User.all.where(open_flag: true).order(id: "DESC")
  end

  def show
    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user[:open_flag] = true
    if @user.save
      flash[:notice] = "新規ユーザー登録完了です。"
      redirect_to users_path
    else 
      flash[:notice] = "新規ユーザー登録失敗です。"
      render :new
    end

  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "更新完了しました。"
    else
      flash[:notice] = "更新できませんでした。"
    end
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :image, :birthday, :password_digest, :gender)
  end

  def get_user_from_id
    @user = User.find(params[:id])
  end
end
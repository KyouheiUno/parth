class UsersController < ApplicationController

  def index
    @users = User.all.where(open_flag: true).order(id: "DESC")
  end

  def show
    @user = User.find(params[:id])
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

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :image, :birthday, :password_digest, :gender)
  end

end
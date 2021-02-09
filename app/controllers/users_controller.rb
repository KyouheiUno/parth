class UsersController < ApplicationController

  def index
    #ユーザー情報を一覧で取得(降順)
    @users = User.all.order(id: "DESC")
  end

  def show
    @user = User.find(params[:id])
  end

  #新規ユーザー登録をするページ
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    #新規ユーザー登録が成功したらindexページへリダイレクトする
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

  def destroy
    @delete_user = User.find(params[:id])
    #ユーザーの情報を削除
    if @delete_user.delete
      flash[:danger] = "ユーザーを削除いたしました。"
      redirect_to users_path
    else
      flash[:notice] = "ユーザーの削除ができませんでした。"
      redirect_to users_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :image, :profession, :birthday, :password_digest)
  end
end


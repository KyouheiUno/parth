class UsersController < ApplicationController

  def index
    @users = User.all.order(id: "DESC")
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
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

  #論理削除の切り替え
  def logical_deletion_change
    @logical_deletion_user = User.find(params[:id])
    if @logical_deletion_user.logical_deletion
      @logical_deletion_user.update(logical_deletion: false)
      flash[:notice] = "#{@logical_deletion_user.name}を論理削除を取り消しました"
    else
      @logical_deletion_user.update(logical_deletion: true)
      flash[:notice] = "#{@logical_deletion_user.name}を論理削除しました"
    end
    redirect_back(fallback_location: users_path)
  end

  def destroy
    @delete_user = User.find(params[:id])
    if @delete_user.delete
      flash[:danger] = "ユーザーを削除いたしました。"
      redirect_to users_path
    else
      flash[:notice] = "ユーザーの削除ができませんでした。"
      redirect_to users_path
    end
  end

  #ユーザーの情報をすべて削除
  if Rails.env.development?
    def destroy_all
      User.destroy_all
      redirect_to users_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :image, :birthday, :password_digest, :gender)
  end

end

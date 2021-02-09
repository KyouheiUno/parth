class RoutinesController < ApplicationController
  def index
    @routines = Routine.all

  end

  def show
  end

  def new
    #Routineのインスタンスを生成
    @routine = Routine.new
  end

  def confirm
    # byebug
    @routine = Routine.new(routine_params)
  end

  def create
    @routine = Routine.new(routine_params)
    #新規ユーザー登録が成功したらindexページへリダイレクトする
    if @routine.save
      flash[:notice] = "新規ルーティーン作成完了です。"
      redirect_to routines_path
    else 
      flash[:notice] = "新規ルーティーン作成失敗です。"
      render :new
    end
    
  end

  def edit
  end

  def update
  end

  def destroy
    @delete_routine = Routine.find(params[:id])
    #ルーティーンカードの情報を削除
    if @delete_routine.delete
      flash[:danger] = "ルーティーンを削除しました。"
      redirect_to routines_path
    else
      flash[:notice] = "ルーティーンカードを削除できませんでした。"
      redirect_to routines_path
    end
  end

  private

  def routine_params
    #routineのストロングパラメータを定義
    params.require(:routine).permit(:title, :content, :category, :todo_monday, :todo_tuesday, :todo_wednesday, :todo_thursday, :todo_friday, :todo_saturday, :todo_sunday,:todo_holiday, :start_time, :close_time, :routine_image)
  end

end

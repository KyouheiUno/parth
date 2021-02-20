class RoutinesController < ApplicationController
  before_action :get_routine_from_id, only: [:show, :edit, :update, :destroy]

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
    @routine.user_id = @current_user_id

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

  #ルーティーンカードの情報を削除
  def destroy
    if @routine.delete
      flash[:danger] = "ルーティーンを削除しました。"
    else
      flash[:notice] = "ルーティーンカードを削除できませんでした。"
    end
    redirect_to routines_path
  end

  private

  #ストロングパラメータ
  def routine_params
    params.require(:routine).permit(:title, :content, :category, :todo_monday, :todo_tuesday, :todo_wednesday, :todo_thursday, :todo_friday, :todo_saturday, :todo_sunday,:todo_holiday, :start_time, :close_time, :routine_image)
  end

  #idからオブジェクト取得
  def get_routine_from_id
    @routine = Routine.find(params[:id])
  end
end
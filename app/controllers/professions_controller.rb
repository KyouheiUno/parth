class ProfessionsController < ApplicationController

  #indexのページに新規登録フォームをいれる
  def index
    @professions =  Profession.all
  end

  #職業を登録
  def create
    @profession = Profession.new()
    @profession[:profession_name] = params[:profession_name]
    @profession[:profession_category] = params[:profession_category]
    
    if @profession.save
      flash[:notice] = "作成しました"
    else
      flash[:warning] = "作成できませんでした"
    end
    redirect_to professions_path
  end

  #職業を削除
  def destroy
    @profession = Profession.find(params[:id])
    @profession.delete
    flash[:notice] = "データを削除しました"
    redirect_to professions_path
  end

  private

  def profession_params
    params.require(:profession).permit(:profession_name, :profession_category)
  end
end

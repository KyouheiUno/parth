class ProfessionUser < ApplicationRecord
  belongs_to :user
  belongs_to :profession

  #イニシャライズ
  def initialize(profession_id, usre_id)
    @profession_id = profession_id
    @user_id = user_id
  end
  #新規登録
  def create
    @profession_users = ProfessionUser.new(
      profession_id: @profession_id,
      user_id: @user_id,
    )
    @profession_users.save!
  end
end

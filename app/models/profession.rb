#職業一覧を格納しているテーブルです。
class Profession < ApplicationRecord
    #リレーション
    has_many :profession_users
    has_many :users, through: :profession_users
    accepts_nested_attributes_for :profession_users

    #バリデーション
    validates :profession_name, presence: true, uniqueness: true
end

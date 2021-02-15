#職業一覧を格納しているテーブルです。
class Profession < ApplicationRecord
    #バリデーション
    validates :profession_name, presence: true, uniqueness: true
end

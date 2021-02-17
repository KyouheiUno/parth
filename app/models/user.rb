class User < ApplicationRecord
    #リレーション
    has_many :profession_users
    has_many :professions, through: :profession_users

    has_many :routine
    #パスワードを暗号化して表示するための記述
    has_secure_password validations: true

    validates :email, presence: true, uniqueness: true
    #画像アップロード
    mount_uploader :image, ImageUploader

    #メールアドレスからユーザーIDを取得するメソッド
    def get_from_email_to_id(target_value)
        @get_user_obj = User.find_by(email: target_value)
        return @get_user_obj.id
    end

    #ユーザーIDからメールアドレスを取得するメソッド
    def get_from_id_to_email(target_value)
        @get_user_obj = User.find_by(id: target_value)
        return get_user_obj.email
    end
end
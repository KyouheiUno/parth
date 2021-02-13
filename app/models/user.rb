class User < ApplicationRecord
    #パスワードを暗号化して表示するための記述
    has_secure_password validations: true

    validates :mail, presence: true, uniqueness: true
    
end
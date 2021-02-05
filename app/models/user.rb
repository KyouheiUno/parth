class User < ApplicationRecord
    #パスワードを暗号化して表示するための記述
    has_secure_password
end
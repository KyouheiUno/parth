#職業の参考データを一括挿入

puts "usersテーブルにレコードを挿入します"
count = 0

#性別の項目を配列で用意する
genmder = ["男性", "女性", "その他"]

#追加するデータを用意する
# add_users_data = [
#     ['name', 1],
#     ['教師', 1]
# ]

puts "挿入するレコード数を入力してください"
input_times = gets.to_i

input_times.times do |n|
    User.create!(
        name: "テストユーザー#{n + 1}",
        email: "test#{n + 1}@test.com",
        image: nil,
        profession: nil, 
        birthday: nil,
        password_digest: "test#{n + 1}"
        gender: genmder[rand(0..2)]
        profession_id: 0
    )
    #挿入レコードをカウントする
    count++
end

#追加データを挿入していく
add_users_data.each do |name, email, image, profession, birthday, password_digest, gender, profession_id|
    User.create!(
        {
            name: name,
            email: email,
            image: image,
            profession: profession,
            birthday: birthday,
            password_digest: password_digest,
            gender: gender,
            profession_id: profession_id 
        }
    )
    count++
end

puts "挿入レコード数 #{count} "
puts "ーーーーーデータ挿入が終了しました。ーーーーー"

#usersテーブルのカラム情報
# name
# email
# image
# profession
# birthday
# password_digest
# gender
# profession_id

#実行コマンド
# rails r db/seeds/add_users_data.rb
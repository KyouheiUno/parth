#職業の参考データを一括挿入

puts "usersテーブルにレコードを挿入します"
count = 0

#性別の項目を配列で用意する
gender = ["男性", "女性", "その他"]

puts "挿入するレコード数を入力してください"
input_times = gets.to_i

1.upto(input_times) do |n|
    User.create!(
        name: "テストユーザー#{n}",
        email: "#{n}test@test.com",
        image: nil,
        birthday: nil,
        password_digest: "test#{n}",
        gender: gender[rand(0..2)],
    )
    count = count + 1
end

puts "挿入レコード数 #{count} "
puts "ーーーーーデータ挿入が終了しました。ーーーーー"

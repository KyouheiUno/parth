#職業の参考データを一括挿入

puts "職業テーブルにレコードを挿入します"
count = 0

#追加するデータを用意する
professions = [
    ['エンジニア', 1],
    ['教師', 1]
]


#追加データを挿入していく
professions.each do |profession_name, profession_category|
    Profession.create!(
        { profession_name: profession_name, profession_name_category: profession_category }
    )
    count++
end

puts "挿入レコード数 #{count} "
puts "ーーーーーデータ挿入が終了しました。ーーーーー"

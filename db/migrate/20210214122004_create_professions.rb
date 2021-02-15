class CreateProfessions < ActiveRecord::Migration[6.1]
  def change
    create_table :professions do |t|
      t.text :profession_name #職業名を格納する
      t.integer :profession_category #職業のカテゴリーを格納する
    end
    #インデックスカラムを追加
    add_index :professions, :profession_name

  end
end

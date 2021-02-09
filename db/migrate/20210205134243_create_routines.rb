class CreateRoutines < ActiveRecord::Migration[6.1]
  def change
    create_table :routines do |t|
      t.string      :title      #タイトル
      t.text        :content    #内容
      t.string      :category   #カテゴリー
      t.integer     :todo_monday ,default: 0 #月曜日
      t.integer     :todo_tuesday ,default: 0 #火曜日
      t.integer     :todo_wednesday ,default: 0 #水曜日
      t.integer     :todo_thursday ,default: 0 #木曜日
      t.integer     :todo_friday ,default: 0 #金曜日
      t.integer     :todo_saturday ,default: 0 #土曜日
      t.integer     :todo_sunday ,default: 0 #日曜日
      t.integer     :todo_holiday ,default: 0 #祝日
      t.time        :start_time #開始時刻
      t.time        :close_time #終了時刻
      t.string      :routine_image #イメージ画像
      t.references :user, foreign_key: true,  null: false #外部キーを作成

      t.timestamps
    end
    #インデックスカラムを追加
    add_index :routines, :category
  end
end

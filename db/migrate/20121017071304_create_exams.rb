# -*- encoding: UTF-8 –*-
class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
			t.integer :user
			t.integer :min					# 制限時間(分)
			t.integer :sec					# 				(秒)
			# テストのタイトル
			t.string 	:title, :default => "テスト"
			t.integer :questionNum	# 問題数
      t.boolean :type         # テストの種類
      t.timestamps
    end
  end
end

# -*- encoding: UTF-8 –*-
class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
			t.integer :min					# 制限時間(分)
			t.integer :sec					# 				(秒)
			t.text 		:title				# テストのタイトル
			t.integer :questionNum	# 問題数

      t.timestamps
    end
  end
end

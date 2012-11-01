# -*- encoding: UTF-8 –*-
class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
			t.integer :user
			t.integer :min					# 制限時間(分)
			t.integer :sec					# 				(秒)
			# テストのタイトル
			t.string 	:title, :default => "テスト", :null => false
			t.integer :questionNum	# 問題数

      t.timestamps
    end
  end
end

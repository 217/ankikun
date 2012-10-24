class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
			t.integer :question_num			# 問題数

      t.timestamps
    end
  end
end

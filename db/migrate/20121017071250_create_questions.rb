# coding: utf-8
class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
			t.integer	:test_id 		# テストIDを管理
			t.integer :kind				# 問題の種類
			t.integer :sub_kind		# N択のNなどの種類

			t.text :body

      t.timestamps
    end
  end
end

# coding: utf-8
class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
			t.integer	:exam_id 		# テストIDを管理
			t.integer :question_id# 質問のIDを管理
			t.integer :kind				# 問題の種類
			t.integer :sub_kind		# N択のNなどの種類

			t.text :body# , :defalut => "", :null => false

      t.timestamps
    end
  end
end

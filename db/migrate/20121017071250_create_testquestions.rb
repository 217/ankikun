class CreateTestquestions < ActiveRecord::Migration
  def change
    create_table :testquestions do |t|
			t.integer :kind				# 問題の種類
			t.integer :sub_kind		# N択のNなどの種類

			t.text :question_body

      t.timestamps
    end
  end
end

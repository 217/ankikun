class CreateTestQuestions < ActiveRecord::Migration
  def change
    create_table :test_questions do |t|
			t.integer :test_id
			t.integer :question_id

      t.timestamps
    end
		add_index :test_questions, :test_id, :unique => true
  end
end

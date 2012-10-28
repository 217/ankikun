class CreateTestQuestions < ActiveRecord::Migration
  def change
    create_table :test_questions do |t|
			t.integer :test_id, :null => false
			t.integer :question_id, :null => false

      t.timestamps
    end
		add_index :test_questions, :test_id, :unique => true
		add_index :test_questions, :question_id, :unique => true
  end
end

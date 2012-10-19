class CreateTestQuestions < ActiveRecord::Migration
  def change
    create_table :test_testquestions do |t|
			t.integer :test_id
			t.integer :question_id

      t.timestamps
    end
		add_index :test_testquestions, :test_id, :unique => true
		add_index :test_testquestions, :question_id, :unique => true
  end
end

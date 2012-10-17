class CreateTestTestquestions < ActiveRecord::Migration
  def change
    create_table :test_testquestions do |t|
			t.integer :test_id
			t.integer :testquestion_id
			t.integer :testquestionchoices_id

      t.timestamps
    end
		add_index :test_testquestions, :test_id, :unique => true
		add_index :test_testquestions, :testquestion_id, :unique => true
		add_index :test_testquestions, :testquestionchoices_id, :unique => true
  end
end

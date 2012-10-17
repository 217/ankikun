class CreateTestTestquestions < ActiveRecord::Migration
  def change
    create_table :test_testquestions do |t|
			t.integer :test_id
			t.integer :testquestion_id
			t.integer :testquestionchoices_id

      t.timestamps
    end
  end
end

class CreateQuestionChoices < ActiveRecord::Migration
  def change
    create_table :question_choices do |t|
			t.integer :choice_id
      t.integer :question_id
			t.integer :test_id
      
      t.timestamps
    end
	end
end

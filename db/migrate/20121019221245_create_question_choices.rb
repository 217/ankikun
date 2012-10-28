class CreateQuestionChoices < ActiveRecord::Migration
  def change
    create_table :question_choices do |t|
			t.integer :choice_id
      t.integer :question_id
      
      t.timestamps
    end
		add_index :question_choices, :choice_id, :unique => true
		add_index :question_choices, :question_id, :unique => true
   end
end

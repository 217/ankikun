class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
			t.integer :question_id
			t.integer :choice_id
      t.text :choice_text
			t.boolean :right

      t.timestamps
    end
  end
end

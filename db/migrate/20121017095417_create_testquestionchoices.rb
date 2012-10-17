class CreateTestquestionchoices < ActiveRecord::Migration
  def change
    create_table :testquestionchoices do |t|
      t.text :choices
			t.boolean :right_anster

      t.timestamps
    end
  end
end

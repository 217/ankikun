class CreateChoices < ActiveRecord::Migration
  def change
    create_table :testquestionchoices do |t|
      t.text :choices
			t.boolean :right

      t.timestamps
    end
  end
end

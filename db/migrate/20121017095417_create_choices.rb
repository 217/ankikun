class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.text :choice_text
			t.boolean :right

      t.timestamps
    end
  end
end

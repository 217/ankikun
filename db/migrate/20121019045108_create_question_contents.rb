class CreateQuestionContents < ActiveRecord::Migration
  def change
    create_table :question_contents do |t|
      t.integer :question_id
      t.integer :content_id

      t.timestamps
    end
  end
end

class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
			t.integer :ask_id
			t.integer :response_num
			t.integer :user

			t.text :body

      t.timestamps
    end
  end
end

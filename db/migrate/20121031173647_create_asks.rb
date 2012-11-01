class CreateAsks < ActiveRecord::Migration
  def change
    create_table :asks do |t|
			t.string :title
			t.integer :user

      t.timestamps
    end
  end
end

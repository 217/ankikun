class CreateAsks < ActiveRecord::Migration
  def change
    create_table :asks do |t|
			t.string :title
			t.boolean :solution

      t.timestamps
    end
  end
end

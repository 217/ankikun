class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
			t.integer :exam_id
      t.integer :questionNum
      t.integer :trueQuestion

      t.timestamps
    end
  end
end

class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :questionNum
      t.integer :tureQuestion

      t.timestamps
    end
  end
end

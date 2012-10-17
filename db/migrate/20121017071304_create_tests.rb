class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
			t.integer :questions			# 問題数

      t.timestamps
    end
  end
end

class CreateWikis < ActiveRecord::Migration
  def change
    create_table :wikis do |t|
			t.integer :user
      t.string :title , :null => false
			t.boolean :close , :default => false , :null => false
			
      t.timestamps
    end

  end
end

class CreateWikis < ActiveRecord::Migration
  def change
    create_table :wikis do |t|
      t.integer :owner_id , :null => false
			t.integer :wiki_id , :null => false
			t.integer :page_id , :null => false
			
      t.string :title , :null => false
      t.text :body , :null => false
			
      t.timestamps
    end

		add_index :wiki , :page_id , :unique => true
  end
end

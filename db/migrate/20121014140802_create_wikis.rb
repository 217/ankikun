class CreateWikis < ActiveRecord::Migration
  def change
		belongs_to :wikipage

    create_table :wikis do |t|
      t.string :title , :null => false
			t.boolean :close , :default => false , :null => false
			t.integer :wiki_id , :null => false
			
      t.timestamps
    end

		add_index :wikis , :wiki_id , :unique => true
  end
end

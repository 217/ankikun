class CreateWikis < ActiveRecord::Migration
  def change
    create_table :wikis do |t|
      t.string :title , :null => false
			t.boolean :close , :default => false , :null => false
			t.integer :wikis_id,:null => false
			
      t.timestamps
    end

		add_index :wikis, :wikis_id, :uniqe => true
		add_column :wikis, :wiki_id, :integer
  end

	def down
		drop_table :wikis
	end

end

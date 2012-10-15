class CreateWikis < ActiveRecord::Migration
  def change
    create_table :wikis,:primary_key => "wiki_id" do |t|
      t.string :title , :null => false
			t.boolean :close , :default => false , :null => false
			t.integer :wiki_id,:null => false
			
      t.timestamps
    end

		add_index :wikis, :wiki_id,:uniqe => true
  end

	def down
		drop_table :wikis
	end

end

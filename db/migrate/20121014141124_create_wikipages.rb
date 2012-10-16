class CreateWikipages < ActiveRecord::Migration
  def change
    create_table :wikipages,:primary_key => "page_id" do |t|
      t.integer :owner_id , :null => false
      t.integer :wiki_id , :null => false
      t.string :title , :null => false
      t.text :body ,:null => false

      t.timestamps
    end

		add_index :wikipages, :wiki_id, :uniqe => true
		# add_column :wikipages, :wikipage_id,:integer
  end

	def down
		drop_table :wikipages
	end
end

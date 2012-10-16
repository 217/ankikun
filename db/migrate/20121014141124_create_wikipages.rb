class CreateWikipages < ActiveRecord::Migration
  def change
    create_table :wikipages,:primary_key => "page_id" do |t|
      t.integer :owner_id , :null => false
      t.string :title , :null => false
      t.text :body ,:null => false

      t.timestamps
    end
  end

	def down
		drop_table :wikipages
	end
end

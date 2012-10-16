class CreateWikis < ActiveRecord::Migration
  def change
    create_table :wikis do |t|
      t.string :title , :null => false
			t.boolean :close , :default => false , :null => false
			
      t.timestamps
    end

  end

	def down
		drop_table :wikis
	end

end

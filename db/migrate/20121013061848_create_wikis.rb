class CreateWikis < ActiveRecord::Migration
  def change
    create_table :wikis do |t|
      t.integer :owner_id
			t.integer :wiki_id
			t.integer :story_id
			
      t.string :title
      t.text :body
			
      t.timestamps
    end
  end
end

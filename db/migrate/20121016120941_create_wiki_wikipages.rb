class CreateWikiWikipages < ActiveRecord::Migration
  def change
    create_table :wiki_wikipages do |t|
      t.integer :wiki_id
      t.integer :wikipage_id

      t.timestamps
    end
		add_index :wiki_wikipages, :wiki_id, :unique => true
		add_index :wiki_wikipages, :wikipage_id, :unique => true 
  end
end

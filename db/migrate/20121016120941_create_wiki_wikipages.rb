class CreateWikiWikipages < ActiveRecord::Migration
  def change
    create_table :wiki_wikipages do |t|
      t.integer :wiki_id
      t.integer :wikipage_id

      t.timestamps
    end
  end
end

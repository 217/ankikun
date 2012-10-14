class CreateWikipages < ActiveRecord::Migration
  def change
    create_table :wikipages do |t|
      t.integer :owner_id
      t.integer :wiki_id
      t.integer :page_id
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end

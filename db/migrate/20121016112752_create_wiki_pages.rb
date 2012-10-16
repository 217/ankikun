class CreateWikiPages < ActiveRecord::Migration
  def change
    create_table :wiki_pages do |t|

      t.timestamps
    end
  end
end

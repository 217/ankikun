class CreateWikipages < ActiveRecord::Migration
  def change
    create_table :wikipages do |t|
      t.integer :owner_id , :null => false
      t.string :title , :null => false
      t.text :body, :null => false

      t.timestamps
    end
  end
end

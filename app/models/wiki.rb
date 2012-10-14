class Wiki < ActiveRecord::Base
  attr_accessible :body, :owner_id, :page_id,:title, :wiki_id
end


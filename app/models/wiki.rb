class Wiki < ActiveRecord::Base
  attr_accessible :body, :owner_id, :story_id,:title, :wiki_id
end


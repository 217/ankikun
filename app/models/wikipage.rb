class Wikipage < ActiveRecord::Base
  attr_accessible :body, :owner_id, :page_id, :title
end

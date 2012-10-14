class Wikipage < ActiveRecord::Base
  attr_accessible :body, :owner_id, :page_id, :title
	belongs_to :wiki
end

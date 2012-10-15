class Wikipage < ActiveRecord::Base
	belongs_to :wiki
  attr_accessible :body, :owner_id, :page_id, :title
end

class Wikipage < ActiveRecord::Base
	belongs_to :wiki
	accepts_nested_attributes_for :wiki
	
  attr_accessible :body, :owner_id, :wiki_id, :title
end

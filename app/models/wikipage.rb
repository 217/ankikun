class Wikipage < ActiveRecord::Base
	has_and_belongs_to_many :wikis
	accepts_nested_attributes_for :wiki
	
  attr_accessible :body, :owner_id, :wiki_id, :title
end

class Wikipage < ActiveRecord::Base
	has_many :wiki_wikipages
	has_many :wikis,:through => :wiki_wikipages
	accepts_nested_attributes_for :wikis
		
  attr_accessible :body, :owner_id, :title
end

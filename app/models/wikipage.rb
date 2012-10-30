class Wikipage < ActiveRecord::Base
	belongs_to :wiki

	attr_accessible :body, :owner_id, :title, :wiki_id, :wikipage_id
end

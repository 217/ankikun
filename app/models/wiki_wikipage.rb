class WikiWikipage < ActiveRecord::Base
	belongs_to :wiki
	belongs_to :wikipage

  attr_accessible :wiki_id, :wikipage_id
end

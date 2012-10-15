class Wikipage < ActiveRecord::Base
	belongs_to :wiki
	has_and_belongs_to_many :wikis
	accepts_nested_attributes_for :wiki
	
  attr_accessible :body, :owner_id, :page_id, :title
end

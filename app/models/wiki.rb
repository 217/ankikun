class Wiki < ActiveRecord::Base
	has_many :wiki_wikipages
	has_many :wikipages,:through => :wiki_wikipages
	accepts_nested_attributes_for :wikipages

  attr_accessible :close,:title
end

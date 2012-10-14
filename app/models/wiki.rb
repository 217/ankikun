class Wiki < ActiveRecord::Base
  attr_accessible :close,:title,:wiki_id
	has_many :wikipage
end

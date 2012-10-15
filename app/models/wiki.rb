class Wiki < ActiveRecord::Base
	has_many :wikipages
  attr_accessible :close,:title,:wiki_id
end

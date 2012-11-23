class Ask < ActiveRecord::Base
	has_many :responses	

  attr_accessible :title, :solution
end

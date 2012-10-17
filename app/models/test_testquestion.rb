class TestTestquestion < ActiveRecord::Base
	belongs_to :test
	belongs_to :testquestion

	attr_accessible :test_id, :testquestion_id
end

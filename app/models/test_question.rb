class TestQuestion < ActiveRecord::Base
	belongs_to :test
	belongs_to :question

	attr_accessible :test_id,:question_id
end

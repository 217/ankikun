class TestTestquestion < ActiveRecord::Base
	belongs_to :test
	belongs_to :testquestion
	belongs_to :testquestionchoices

	attr_accessible :questions
end

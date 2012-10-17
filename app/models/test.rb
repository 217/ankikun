class Test < ActiveRecord::Base
	has_many :test_testquestions
	has_many :testquestions, :through => :test_testquestions
	has_many :testquestionchoises, :through => :test_testquestions
	accepts_nested_attributes_for :test_testquestion

  attr_accessible :test_id, :testquestion_id, :testquestionchoise_id
end

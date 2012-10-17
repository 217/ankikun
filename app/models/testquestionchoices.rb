class Testquestionchoices < ActiveRecord::Base
	has_many :test_testquestions
	has_many :tests, :through => test_testquestion
	has_many :testquestions, :through => test_testquestion
	accepts_nested_attributes_for :test_testquestion
	
  attr_accessible :choices, :right_answer
end

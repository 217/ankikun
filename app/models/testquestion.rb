class Testquestion < ActiveRecord::Base
	has_many :test_testquestions
	has_many :tests, :through => :test_testquestions
	has_many :testquestionchoises, :through => :testquestionchoises

	accepts_nested_attributes_for :test_testquestions
	accepts_nested_attributes_for :testquestionchoises

  attr_accessible :kind, :sub_kind, :questiona_body
end

class Test < ActiveRecord::Base
	has_many :test_questions
	has_many :questions, :through => :test_questions

	accepts_nested_attributes_for :questions

 	attr_accessible :question_num
end

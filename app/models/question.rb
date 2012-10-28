class Question < ActiveRecord::Base
	has_many :test_questions
	has_many :tests, :through => :test_questions
	has_many :question_choices
	has_many :choices, :through => :question_choices

	accepts_nested_attributes_for :tests
	accepts_nested_attributes_for :choices

  attr_accessible :kind, :sub_kind, :body		
end

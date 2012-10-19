class Test < ActiveRecord::Base
	has_many :test_questions
	has_many :questions, :through => :test_questions
	accepts_nested_attributes_for :test_questions

  # attr_accessible
end

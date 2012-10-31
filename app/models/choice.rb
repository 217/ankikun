class Choice < ActiveRecord::Base
	has_many :question_choices
	has_many :questions, :through => :question_choices, :source => :question

	accepts_nested_attributes_for :questions

	attr_accessible :choice_text, :right
end

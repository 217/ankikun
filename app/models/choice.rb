class Choice < ActiveRecord::Base
	has_many :question_choices
	has_many :questions, :through => :question_choice, :source => :question

	attr_accessible :choice_id, :question_id
end

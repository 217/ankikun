class QuestionChoice < ActiveRecord::Base
  belongs_to :question
	belongs_to :choice
	
	attr_accessible :test_id, :question_id
end

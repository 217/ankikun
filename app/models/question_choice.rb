# coding: utf-8
class QuestionChoice < ActiveRecord::Base
  belongs_to :question
	belongs_to :choice
	
	attr_accessible :test_id, :question_id, :choice_id
end

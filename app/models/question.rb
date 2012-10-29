class Question < ActiveRecord::Base
	belongs_to :test
	has_many :question_choices
	has_many :choices, :through => :question_choices
	
	attr_accessible :kind, :sub_kind, :body	,:test_id	
end

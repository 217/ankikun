class Question < ActiveRecord::Base
	belongs_to :test
	has_many :question_choices
	has_many :choices, :through => :question_choices, :source => :choice

	accepts_nested_attributes_for :choices

	attr_accessible :kind, :sub_kind, :body	,:test_id, :question_id
end

class Question < ActiveRecord::Base
	belongs_to :test
	has_many :choices

	attr_accessible :kind, :sub_kind, :body	,:test_id, :question_id
end

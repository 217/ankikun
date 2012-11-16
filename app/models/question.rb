class Question < ActiveRecord::Base
	belongs_to :exam
	has_many :choices

	attr_accessible :kind, :sub_kind, :body	,:exam_id, :question_id
end

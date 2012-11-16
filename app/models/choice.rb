class Choice < ActiveRecord::Base
	belongs_to :question

	attr_accessible :choice_text, :right, :question_id, :choice_id, :exam_id
end

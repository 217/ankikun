class Question < ActiveRecord::Base
private
	def kind1?
		if :kind
			return true
		else
			return false
		end
	end
public
	belongs_to :exam
	has_many :choices
	validates_presence_of :kind
	validates_presence_of :subkind, :if => :kind1?

	attr_accessible :kind, :sub_kind, :body	,:exam_id, :question_id
end

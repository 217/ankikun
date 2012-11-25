# coding: utf-8
class Question < ActiveRecord::Base
<<<<<<< HEAD
=======
private
	def kind1?
		if :kind
			return true
		else
			return false
		end
	end
>>>>>>> cfccaee2a479c63034f78483e97eb4ecb8a6ec32
public
	belongs_to :exam
	has_many :choices
	validates_presence_of :kind
	validates_presence_of :subkind, :if => :kind1?

<<<<<<< HEAD
  validates :kind, :presence => true
  validate :sub_kind, :presence => true, :if => Proc.new{:kind == 1}
  validates :body, :presence => true

	attr_accessible :kind, :sub_kind, :body ,:exam_id, :question_id
=======
	attr_accessible :kind, :sub_kind, :body	,:exam_id, :question_id
>>>>>>> cfccaee2a479c63034f78483e97eb4ecb8a6ec32
end

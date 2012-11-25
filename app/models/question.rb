# coding: utf-8
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
	# validates_presence_of :kind
	# validates_presence_of :sub_kind, :if => :kind1?

=begin
  validates :kind, :presence => true
  validate :sub_kind, :presence => true, :if => Proc.new{:kind == 1}
  validates :body, :presence => true
=end

	attr_accessible :kind, :sub_kind, :body ,:exam_id, :question_id
end

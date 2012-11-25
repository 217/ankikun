# coding: utf-8
class Question < ActiveRecord::Base
public
	belongs_to :exam
	has_many :choices

  validates :kind, :presence => true
  validate :sub_kind, :presence => true, :if => Proc.new{:kind == 1}
  validates :body, :presence => true

	attr_accessible :kind, :sub_kind, :body ,:exam_id, :question_id
end

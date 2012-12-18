# coding: utf-8
class Exam < ActiveRecord::Base
	has_many :questions
	validates :title, presence: true
	
  attr_accessible :question_num, :min, :sec, :title, :user
end

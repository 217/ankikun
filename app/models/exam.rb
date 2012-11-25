class Exam < ActiveRecord::Base
	has_many :questions
  validates_presence_of :title
  attr_accessible :question_num, :min, :sec, :title, :user
end

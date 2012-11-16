class Exam < ActiveRecord::Base
	has_many :questions

 	attr_accessible :question_num, :min, :sec
end

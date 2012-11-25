class Exam < ActiveRecord::Base
	has_many :questions
<<<<<<< HEAD
  validates_presence_of :title
  
=======
	validates_presence_of :title
	
>>>>>>> cfccaee2a479c63034f78483e97eb4ecb8a6ec32
  attr_accessible :question_num, :min, :sec, :title, :user
end

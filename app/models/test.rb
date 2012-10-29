class Test < ActiveRecord::Base
	has_many :questions

 	attr_accessible :question_num
end

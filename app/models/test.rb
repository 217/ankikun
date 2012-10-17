class Test < ActiveRecord::Base
	has_many :test_testquestions
	has_many :testquestions, :through => :test_testquestions
	accepts_nested_attributes_for :testquestions

  # attr_accessible :title, :body
end

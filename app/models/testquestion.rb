class Testquestion < ActiveRecord::Base
	has_many :test_testquestions
	has_many :tests, :through => :test_testquestions
	accepts_nested_attributes_for :test_testquestions

  # attr_accessible :title, :body
end

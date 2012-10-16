class Wiki < ActiveRecord::Base
	has_many :wikipages
	accepts_nested_attributes_for :wikipages

  attr_accessible :close,:title
end

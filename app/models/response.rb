class Response < ActiveRecord::Base
	belongs_to :ask, :touch => true
  attr_accessible :body, :response_num, :ask_id, :user
end

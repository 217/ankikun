class Response < ActiveRecord::Base
	belongs_to :ask
  attr_accessible :body, :res_num, :ask_id
end

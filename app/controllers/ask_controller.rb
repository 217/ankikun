class AskController < ApplicationController
  def new
		@ask = Ask.new
	end

  def create
		Ask.transaction do 
			@ask = Ask.new
			@ask.title = params[:ask][:title]
			@ask.save!
			
			@response = @ask.responses.build(params[:ask][:response])
			@response.response_num = @ask.id
			@response.save!
		end
  end

  def index
  end

  def show
  end
end

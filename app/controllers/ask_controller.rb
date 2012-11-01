# coding: utf-8

class AskController < ApplicationController
  def new
		@ask = Ask.new
	end

  def create
		if params[:id].nil?
			begin 
				Ask.transaction do 
					@ask = Ask.new
					@ask.title = params[:ask][:title]
					@ask.save!
					
					@response = @ask.responses.build(params[:ask][:response])
					@response.ask_id = @ask.id
					@response.response_num = 1
					@response.save!
					redirect_to :action => "index"
				end
			rescue => e
				render :text => "データの書き込みに失敗しました。"
			end
		else
			begin 
				Ask.transaction do
					@ask = Ask.find(params[:id])
					@response = @ask.responses.build
					@response.response_num = (Response.find(:last, :conditions => {:ask_id => params[:id]}).response_num += 1)
					@response.ask_id = @ask.id
					@response.save!
				end
				redirect_to :action => "show"
			rescue => e 
				render :text => "データの書き込みに失敗しました。"
			end
		end
  end

  def index
		@asks = Ask.find(:all)
	end

  def show
		@ask = Ask.find(params[:id])
		@response = @ask.responses.new
  end
end

# coding: utf-8

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
			redirect_to :action => "index"
		end
		rescue => e
			render :text => "データの書き込みに失敗しました。"
  end

  def index
		@asks = Ask.find(:all)
	end

  def show
  end
end

# coding: utf-8
require "pp"

class AskController < ApplicationController
  def new
		if user_signed_in?
			@ask = Ask.new
		else
			render :text => "ログインしてください"
		end
	end

  def create
		if user_signed_in?
			if params[:id].nil?
				begin 
					Ask.transaction do 
						@ask = Ask.new
						@ask.title = params[:ask][:title]
						@ask.solution = false
						@ask.save!
					
						@response = @ask.responses.build(params[:ask][:response])
						@response.ask_id = @ask.id
						@response.response_num = 1
						@response.user = current_user.id
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
						@response = @ask.responses.new
						@response.body = params[:response][:body]
						@response.response_num = (Response.find(:last, :conditions => {:ask_id => params[:id]}).response_num += 1)
						@response.ask_id = @ask.id
						@response.user = current_user.id
						@response.save!
						@ask.update_attribute(:updated_at, @response.created_at)
					end
					redirect_to :action => "show"
				#rescue => e 
				#	render :text => "データの書き込みに失敗しました。"
				end
			end
		else 
			render :text => "ログインしてください	"
		end
  end

  def index
		@asks = Ask.find(:all)
	end

  def show
		@ask = Ask.find(params[:id])
		# @response = @ask.responses.new
  end

	def update
		@ask = Ask.find(params[:id])
		
		if @ask.responses[0].user == current_user.id
			@ask.update_attribute(:solution,true)
			redirect_to :action => "/ask/#{params[:id]}/show"
		else
			render :text => "投稿者でログインされないと、解決済みに出来ません。"
		end
	end
end

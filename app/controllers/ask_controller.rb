# coding: utf-8
require "pp"

class AskController < ApplicationController
private
  def login?
    unless user_signed_in?
      render :text => "ログインしてください。"
    end
  end
public
  before_filter :login?, :only => ["new", "create"]
	
	def new
		@ask = Ask.new
	end

  def create
    if params[:id].nil?
      begin 
        Ask.transaction do 
          @ask = Ask.create!(
                          :title => params[:ask][:title],
                          :solution => false
                        )
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
          ask = Ask.find(params[:id])
          ask.responses.create!(
               	                :body => params[:response][:body],
          	                    :response_num => (Response.find(:last, :conditions => {:ask_id => params[:id]}).response_num += 1),
                                :user => current_user.id
                                )
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
  end

	def update
		@ask = Ask.find(params[:id])
		
		# 謎のバグが発生する。
		if @ask.responses[0].user == current_user.id
			@ask.update_attribute(:solution, true)
			redirect_to "/ask/#{params[:id]}/show"
		else
			render :text => "投稿者でログインされないと、解決済みに出来ません。"
		end
	end
end

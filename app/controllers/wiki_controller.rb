#!/usr/bin/ruby
# -*- coding:utf-8 -*-
class WikiController < ApplicationController
  def index
		@wiki = Wiki.find(:first,:conditions => {:wiki_id => params[:id], :page_id => params[:sub_id]})
  end

  def new
		@wiki = Wiki.new()
  end

  def create
		@wiki = Wiki.new(params[:wiki])

		# Test Code
		@wiki.wiki_id = params[:id]
		@wiki.owner_id = 0 
		@wiki.page_id = 1

		if @wiki.save
			redirect_to :action => "index"
		else 
			render_action "new"
		end

  end

  def edit

	end

  def destroy
		@wiki = Wiki.find(:first,:conditions => {:wiki_id => params[:id],:page_id => params[:sub_id]}) 

		# 本来は、JSを用いず、Railsの力で書きたい
		if params[:destroy_button] then
			@wiki.destroy
			# render :text => '<h1>削除しました。3秒後、移動します。</h1>'
			redirect_to '/wiki/0/0/index' and return
		elsif params[:back_button] then
			# render :text => '<h1>3秒後、トップページに移動します。</h1>'
			redirect_to '/wiki/0/0/index' and return
		end
  end
end

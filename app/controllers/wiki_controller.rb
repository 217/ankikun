#!/usr/bin/ruby
# -*- coding:utf-8 -*-
class WikiController < ApplicationController
  def index
		@wiki = Wiki.find(:first,:conditions => {:wiki_id => params[:id], :story_id => params[:sub_id]})
  end

  def new
		@wiki = Wiki.new()
  end

  def create
		@wiki = Wiki.new(params[:wiki])

		@wiki.wiki_id = 1
		@wiki.owner_id = 0 
		@wiki.story_id = 1

		if @wiki.save
			redirect_to :action => "index"
		else 
			render_action "new"
		end

  end

  def edit

	end

  def destroy
		@wiki = Wiki.find(:first,:conditions => {:wiki_id => params[:id],:story_id => params[:sub_id]}) 

		if params[:destroy_button] then
			@wiki.destroy
			# render :text => '<h1>削除しました。3秒後、移動します。</h1>'
			sleep 3
			redirect_to '/wiki/0/0/index' and return
		elsif params[:back_button] then
			# render :text => '<h1>3秒後、トップページに移動します。</h1>'
			sleep 3
			redirect_to '/wiki/0/0/index' and return
		end
  end
end

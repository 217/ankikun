# -*- coding:utf-8 -*-
class WikiController < ApplicationController
  def index
		@wiki = Wiki.find(:first,:conditions => {:wiki_id => 0 , :story_id => 0})
  end

  def new
		@wiki = Wiki.new()
  end

  def create
		@wiki = Wiki.new(params[:wiki])

		@wiki.wiki_id = 0
		@wiki.owner_id = 0 
		@wiki.story_id = 0

		if @wiki.save
			redirect_to :action => "index"
		else 
			render_action "new"
		end
  end

  def edit

	end

  def destroy
		
  end
end


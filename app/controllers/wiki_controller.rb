# -*- encoding: utf-8 -*-
class WikiController < ApplicationController
  def index
		@wiki = Wiki.find(:first,:conditions => {:wiki_id => params[:id],:page_id => 0})
  end

  def show
		@wiki = Wiki.find(:first,:conditions => {:wiki_id => params[:id],:page_id => params[:sub_id]})
  end

  def new
		@wiki = Wiki.new
  end

  def create
		@wiki = Wiki.new(params[:wiki])

		# Test Code
		@wiki.wikipage.owner_id = 0

		@wiki.wiki_id = params[:id]
		
		if @wiki.save
			redirect_to "wiki/index"
		else
			render :action => "new" 
		end
  end

  def edit
		
  end

  def update

  end

  def destroy

  end
end

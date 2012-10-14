# -*- encoding: utf-8 -*-
class WikiController < ApplicationController
  def index
		@wiki = Wiki.find(:first,:conditions => {:wiki_id => params[:id],:page_id => 0})
  end

  def show
		@wiki = Wiki.find(:first,:conditions => {:wiki_id => params[:id],:page_id => 0})
  end

  def new
		@wiki = Wiki.new
  end

  def create
		@wiki = Wiki.new(params[:wiki])

		# Test Code
		@wiki.owner_id = 0

		@wiki.wiki_id = params[:id]		
  end

  def edit

  end

  def update

  end

  def destroy

  end
end

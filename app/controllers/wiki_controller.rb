# -*- encoding: utf-8 -*-
class WikiController < ApplicationController
  def index
		@wiki = Wiki.find(:first,:conditions => {:wiki_id => params[:id],:page_id => 0})
  end

  def show
		@wiki = Wiki.find(:first,:conditions => {:wiki_id => params[:id],:page_id => params[:sub_id]})
  end

  def new
		if params[:id].empty?
		
		end
  end

  def create
=begin
		@wiki = Wiki.find(params[:wikis])
		# とりあえず、owner_idを0に固定
		# @wiki.build_wikipages でも可能
		@page = @wiki.wikipages.build(:owner_id => 0)
		
		# Test Code
		# @wiki.wikipages.owner_id = 0
		
		@page.wiki_id = params[:id]

		if @page.save
			redirect_to "wiki/index"
		else
			render :new
		end
=end
  end

  def edit
		
  end

  def update

  end

  def destroy

  end
end


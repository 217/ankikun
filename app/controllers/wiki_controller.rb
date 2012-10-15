# -*- encoding: utf-8 -*-
class WikiController < ApplicationController
  def index
		@wiki = Wiki.find(:first,:conditions => {:wiki_id => params[:id],:page_id => 0})
  end

  def show
		@wiki = Wiki.find(:first,:conditions => {:wiki_id => params[:id],:page_id => params[:sub_id]})
  end

  def new
		if params[:id].nil?
			@wiki = Wiki.new
		else
			@page = Wiki.find(:first,:conditions => {:wiki_id => params[:id]}).wikipage.build
		end
		
  end

  def create
		if params[:id].nil?
			@wiki = Wiki.new(params[:wiki])
			
			if @wiki.save
				redirect_to "wiki/#{@wiki.wiki_id}/index"
			else
				render :action => "wiki/new"
			end
		else
			
		end
  end

  def edit
		
  end

  def update

  end

  def destroy

  end
end


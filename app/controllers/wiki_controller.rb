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
			# @page = @wiki.wikipages.new
		else
			@page = Wiki.find(:first,:conditions => {:wiki_id => params[:id]}).build_wikipages
		end
		
  end

  def create
		if params[:id].nil?
			wiki = Wiki.new(params[:wiki])
			page = wiki.wikipages.new

			page.title = "Wikiへようこそ！"
			page.owner_id = 0
			page.body = "hoge"
			
			wiki.wikipages.push(page)
=begin
			@wiki = Wiki.new(params[:wiki])
			@wiki.wikipages.title = "Wikiへようこそ!"
			@wiki.wikipages.owner_id = 0
			@page.wikipages.body = "hoge"
=end
			redirect_to "/wiki/index"
=begin
			if @wiki.save
				redirect_to "/wiki/index"
			else
				render :action => "/wiki/new"
			end
=end
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


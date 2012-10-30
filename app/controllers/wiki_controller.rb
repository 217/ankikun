# -*- encoding: utf-8 -*-
require "pp"
class WikiController < ApplicationController
  def index
		if params[:id].nil?
			@wikis = Array.new
			1.times{|t| 
				@wikis << Wiki.find(:all, :include => :wikipages, :conditions => {"wikipages.wiki_id" => t+1, "wikipages.wikipage_id" => 1})
			}
			pp @wikis
		else
			@wiki = Wiki.find(:first, {:include => :wiki_wikipages, :conditions => {"wiki_wikipages.wiki_id" => params[:id]}})
			if @wiki.nil?
				render :text => "Wikiが見つかりません。"
			end
		end
  end

  def show
		@wiki = Wiki.find(:first,:conditions => {:wiki_id => params[:id],:page_iad => params[:sub_id]})
  end

  def new
		if params[:id].nil?
			@wiki = Wiki.new
		else
			@page = Wiki.find(:first, {:include => :wiki_wikipages, :conditions => {"wiki_wikipages.wiki_id" => params[:id]}}).wikipages.build
		end
  end

  def create
		if params[:id].nil?
			wiki = Wiki.new(params[:wiki])
			page = wiki.wikipages.build

			page.wikipage_id = 1
			page.title = "Wikiへようこそ！"
			page.owner_id = 1
			page.body = "hoge"
			
			# 生成したWikiのURLに飛びたい
			if wiki.save
				redirect_to "/wiki/index"
			else
				render :action => "/wiki/new"
			end
		else
			page = Wiki.new(params[:wiki]).wikipages.build

			page.wiki_wikipages.wiki_id = params[:id]

			page.save

			# page.wiki_wikipages =
		end
  end

  def edit
		
  end

  def update

  end

  def destroy

  end
end


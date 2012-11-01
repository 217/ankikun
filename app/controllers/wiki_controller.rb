# -*- encoding: utf-8 -*-
require "pp"
class WikiController < ApplicationController
  def index
		if params[:id].nil?
			@wikis = Wiki.find(:all)
		else
			@wiki = Wiki.find(:first, {:include => :wikipages, :conditions => {"wikipages.wiki_id" => params[:id]}})
			if @wiki.nil?
				render :text => "Wikiが見つかりません。"
			end
		end
  end

  def show
		@wiki = Wiki.find(:first, :conditions => {:wiki_id => params[:id],:page_iad => params[:sub_id]})
  end

  def new
		if user_signed_in?
			if params[:id].nil?
				@wiki = Wiki.new
			else
				@wiki = Wiki.find(params[:id])
				@page = @wiki.wikipages.new
			end
		else
			render :text => "ログインしてください。"
		end
  end

  def create
		if user_signed_in?
			if params[:id].nil?
				wiki = Wiki.new
				wiki.title = params[:wiki][:title]
				wiki.user = current_user.id
	
				page = wiki.wikipages.build

				page.wikipage_id = 1
				page.title = "トップページ"
				page.body = params[:wiki][:wikipage][:body]
				
				if wiki.save
					redirect_to "/wiki/#{wiki.id}/index"
				else
					render :text => "データベースへの書き込みが失敗しました。"
				end
			else
				wiki = Wiki.find(params[:id])
				page = wiki.wikipages.build
				page.title = params[:wikipage][:title]
				page.body = params[:wikipage][:body]
			
				page.wiki_id = params[:id]
				page.wikipage_id = (Wikipage.find(:last, :conditions => {:wiki_id => params[:id]}).wikipage_id + 1)
				page.owner_id = current_user.id
			
				begin
					Wiki.transaction do 
						page.save!
						wiki.updated_at = page.created_at
						wiki.save!
					end
					redirect_to "/wiki/#{params[:id]}/index"
				rescue => e
					render :text => "データベースへの書き込みが失敗しました。"
				end
			end
		else
			render :text => "ログインしてください。"
		end
  end

  def edit
		if user_signed_in?
			@page = Wikipage.find(:first, :conditions => {:wiki_id => params[:id], :wikipage_id => params[:sub_id]})
		else
			render :text => "ログインしてください。"
		end
  end

  def update
		
  end

  def destroy

  end

	def show
		@wiki = Wiki.find(params[:id])
		@page = Wikipage.find(:first, :conditions => {:wiki_id => params[:id], :wikipage_id => params[:sub_id]})
	end
end


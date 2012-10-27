# coding: utf-8
# デバッグ用
require 'pp'

class TestController < ApplicationController
  def new
		@test = Test.new
		@questions = [@test.questions.new]
  end

  def create
		@test = Test.new
		# @question

		# pp params
		
		# 初期化
		i = 0

		Test.transaction do
			@test.save	
			while !params[:question][i.to_s].nil?
				@question = @test.questions.new
				@question.save
			
				case params[:question][i.to_s][:kind]	
				when "1"
					j = 0

					while !params[:question][i.to_s][:choices][j.to_s].nil?
						# 選択肢の代入
						@choice = @question.choices.new
						@choice.choice_text = params[:question][i.to_s][:choices][j.to_s][:choice_text]
						@choice.right = params[:question][i.to_s][:choices][j.to_s][:right]

						# pp "params[:question][i.to_s][:choices][j.to_s][:choice]", params[:question][i.to_s][:choices][j.to_s][:choice_text]
						#	pp "params[:question][i.to_s][:choices][j.to_s][:right]", params[:question][i.to_s][:choices][j.to_s][:right]
						# pp "choice = ",	@choice

						@choice.save

						j += 1
					end
				when "2"
				when "3"
				when "4"
				end

				i += 1
			end
		end
		rescue => e
			render :text => "もう一度送信してください。"
	end

  def index

  end

  def edit
		@test = Test.new
  end

  def destroy

  end
end

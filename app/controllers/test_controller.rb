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

		pp params
		# 
		i = 0
		while !params[:question][i.to_s].nil?
			@question = @test.questions.new
			
			case params[:question][i.to_s][:kind]	
			when "1"
				j = 0
				pp "i = ",i
				pp "j = ",j
				pp "params[:question][i][:choices][i] = ",params[:question][i.to_s][:choices][j.to_s]
				pp params

				while !params[:question][i.to_s][:choices][j.to_s].nil?
					# 選択肢の代入
					@choice = @question.choices.new
					if !@choice.save
						render :text => "Choice NG"
					end
					j += 1
				end
				if !@question.save
					render :text => "question NG"
				end
			when "2"
			when "3"
			when "4"
			end
			i += 1
		end

		if !@test.save
			render :text => "REJECT"
		end
	end

  def index

  end

  def edit
		@test = Test.new
  end

  def destroy

  end
end

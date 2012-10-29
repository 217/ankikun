# coding: utf-8
# デバッグ用
require 'pp'

class TestController < ApplicationController

  def new
		@test = Test.new
		@questions = [@test.questions.new]
  end

  def create
		# タイムゾーンの設定
		Time.zone = 'Asia/Tokyo'

		@test = Test.new
		# @question

		# pp params
		
		# 初期化
		i = 0

		Test.transaction do
			# 2桁までしか入力できないので、制限時間無制限の場合、3桁の100を代入
			@test.min = params[:test][:min] != "" ? params[:test][:min].to_i : 100
			@test.sec = params[:test][:sec] != "" || params[:test][:sec] == "0" ? params[:test][:sec].to_i : 100	
			@test.title = params[:test][:title]

			# テストのセーブ
			# pp @test.save
			# pp "Test = ", @test
			# pp "b"

			while !params[:question][i.to_s].nil?
				@question = @test.questions.new
				@question.kind = params[:question][i.to_s][:kind]
				@question.sub_kind = params[:question][i.to_s][:kind] == "1" ? params[:question][i.to_s][:sub_kind] : 0
				@question.body = params[:question][i.to_s][:body]
				pp @question
				@question.question_id = (i + 1)

				# 問題のセーブ
				@question.save
				
				pp "Question = ", @question
			
				case params[:question][i.to_s][:kind]
				when "1"
					j = 0

					while !params[:question][i.to_s][:choices][j.to_s].nil?
						# 選択肢の代入
						@choice = @question.choices.new
						@choice.choice_text = params[:question][i.to_s][:choices][j.to_s][:choice_text]
						@choice.right = params[:question][i.to_s][:choices][j.to_s][:right] ? true : false

						# pp "params[:question][i.to_s][:choices][j.to_s][:choice]", params[:question][i.to_s][:choices][j.to_s][:choice_text]
						#	pp "params[:question][i.to_s][:choices][j.to_s][:right]", params[:question][i.to_s][:choices][j.to_s][:right]
						# pp "choice = ",	@choice
					
						@questionChoiceIds = @choice.question_choices.build
						@questionChoiceIds.question_id = (i + 1)
						@questionChoiceIds.choice_id = (j + 1)
						
						@choice.save

						pp @choice

						j += 1
					end
				when "2"		
					# p @choice
					@choice = @question.choices.build
					@choice.choice_text = ""
					@choice.right = params[:question][i.to_s][:choices]["0"][:right] ? true : false
					
					@questionChoiceIds = @choice.question_choices.build
					@questionChoiceIds.question_id = (i + 1)
					@questionChoiceIds.choice_id = 1

					@choice.save
				when "3"
					@choice = @question.choices.build
					@choice.choice_text = params[:question][i.to_s][:choices]["0"][:choice_text]
					@choice.right = "t"

					@questionChoiceIds = @choice.question_choices.build
					@questionChoiceIds.question_id = (i + 1)
					@questionChoiceIds.choice_id = 1

					@choice.save
				when "4"
					# まだ実装しない
				end

				i += 1
			end
			
			@test.questionNum = i.to_s
			@test.save

			pp "@test.sec = " , @test.sec
			redirect_to :action => "index"
		end
		#rescue => e
		#	render :text => "エラーが発生しました。"
	end

  def index
		# pp Test.find(:all, {:include => :test_questions})[0].test_questions
		@tests = Test.find(:all, {:include => :questions, :conditions => {"questions.question_id" => 	1}})
		# pp @tests
  end

  def edit
		@test = Test.new
  end

  def destroy

  end
end

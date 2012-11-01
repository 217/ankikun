# coding: utf-8
# デバッグ用
require 'pp'

class TestController < ApplicationController
  def new
		if user_signed_in?
			@test = Test.new
			@questions = [@test.questions.new]
		else
			render :text => "ログインしてください。"
		end
  end

  def create
		if user_signed_in?
			@test = Test.new
			# @question

			pp params
			
			# 初期化
			i = 0	
			begin
				Test.transaction do
					while !params[:question][i.to_s].nil?
						@test.questionNum = (i + 1)
						i += 1
					end
	
					# 2桁までしか入力できないので、制限時間無制限の場合、3桁の100を代入
					@test.min = params[:test][:min] != "" ? params[:test][:min].to_i : 100
					@test.sec = params[:test][:sec] != "" || params[:test][:sec] == "0" ? params[:test][:sec].to_i : 100	
					@test.title = params[:test][:title]
					@test.user = current_user.id
					@test.save
	
					# テストのセーブ
					# pp @test.save
					# pp "TequestionNumst = ", @test
					# pp "b"

					i = 0
					while !params[:question][i.to_s].nil?
						@question = @test.questions.new
						@question.kind = params[:question][i.to_s][:kind]
						@question.sub_kind = params[:question][i.to_s][:kind] == "1" ? params[:question][i.to_s][:sub_kind] : 0
						@question.body = params[:question][i.to_s][:body]
						# pp @question
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
								@choice.test_id = @test.id
								@choice.question_id = @question.question_id
								@choice.choice_id = (j + 1)
								pp @choice

								@choice.save!
								pp @choice

								j += 1
							end
						when "2"		
							# p @choice
							@choice = @question.choices.build
							@choice.choice_text = ""
							@choice.right = params[:question][i.to_s][:choices]["0"][:right] ? true : false
					
							@choice.test_id = @test.id
							@choice.question_id = @question.question_id
							@choice.choice_id = 1

							@choice.save!
						when "3"
							@choice = @question.choices.build
							@choice.choice_text = params[:question][i.to_s][:choices]["0"][:choice_text]
							@choice.right = "t"

							@choice.test_id = @test.id
							@choice.question_id = @question.question_id
							@choice.choice_id = 1
	
							@choice.save!
						end

						i += 1
					end
					redirect_to :action => "index"
				end
			rescue => e
				render :text => "エラーが発生しました。"
			end
		else 
			render :text => "ログインしてください。"
		end
	end

  def index
		# pp Test.find(:all, {:include => :test_questions})[0].test_questions
		@tests = Test.find(:all, {:include => :questions, :conditions => {"questions.question_id" => 	1}})
		# pp @tests
  end

  def edit
		@question = Question.find(:all, :conditions => {:wiki_id => params[:id], :question_id => params[:sub_id]})
  end

  def destroy
		
  end

	def show
		@test = Test.find(:all, :include => :questions, :conditions => {"questions.test_id" => params[:id]})
		pp "@test = ", @test
	end

	def check
		@test = Test.find(:all, :include => :questions, :conditions => {"questions.test_id" => params[:id]})
		pp @test
	end
end

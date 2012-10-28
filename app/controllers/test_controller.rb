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
			# pp "a"
			# 2桁までしか入力できないので、制限時間無制限の場合、3桁の100を代入
			@test.min = params[:test][:min] != "" ? params[:test][:min].to_i : 100
			@test.sec = params[:test][:sec] != "" || params[:test][:sec] == "0" ? params[:test][:sec].to_i : 100
			@test.save
			pp @test
			# pp "b"

			while !params[:question][i.to_s].nil?
				pp @question = @test.questions.build(params[:question][i.to_s])
				@question.kind = params[:question][i.to_s][:kind]
				@question.sub_kind = params[:question][i.to_s][:kind] == "1" ? params[:question][i.to_s][:sub_kind] : 0
				# エラーになる問題のコード
				# 名前を合わせるのが定石だが、合わせるとエラーになる
				@question.question_body = params[:question][i.to_s][:body]
				@question.save
				pp @question
			
				case params[:question][i.to_s][:kind]
				when "1"
					j = 0

					while !params[:question][i.to_s][:choices][j.to_s].nil?
						# 選択肢の代入
						@choice = @question.choices.build(params[:question][i.to_s][:choices][j.to_s])
						@choice.choice_text = params[:question][i.to_s][:choices][j.to_s][:choice_text]
						@choice.right = params[:question][i.to_s][:choices][j.to_s][:right] ? true : false

						# pp "params[:question][i.to_s][:choices][j.to_s][:choice]", params[:question][i.to_s][:choices][j.to_s][:choice_text]
						#	pp "params[:question][i.to_s][:choices][j.to_s][:right]", params[:question][i.to_s][:choices][j.to_s][:right]
						# pp "choice = ",	@choice

						@choice.save

						pp @choice

						j += 1
					end
				when "2"		
					p @choice
					@choice = @question.choices.build
					@choice.choice_text = ""
					@choice.right = params[:question][i.to_s][:choices]["0"][:right] ? true : false
					@choice.save
				when "3"
					@choice = @question.choices.build
					@choice.choice_text = params[:question][i.to_s][:choices]["0"][:choice_text]
					@choice.right = "t"
					@choice.save
				when "4"
					# まだ実装しない
				end

				i += 1
			end
			redirect_to :action => "index"
		end
		#rescue => e
		#	render :text => "エラーが発生しました。"
	end

  def index
		# pp Test.find(:all, {:include => :test_questions})[0].test_questions
		@tests = Test.find(:all, {:include => :test_questions, :conditions => {"test_questions.question_id" => 1}})
		# pp @tests
  end

  def edit
		@test = Test.new
  end

  def destroy

  end
end

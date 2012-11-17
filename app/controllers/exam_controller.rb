# coding: utf-8
# デバッグ用
# 一応require
require 'pp'
require 'awesome_print'

class ExamController < ApplicationController
  def new
		if user_signed_in?
			@exam = Exam.new
			@questions = [@exam.questions.new]
		else
			render :text => "ログインしてください。"
		end
  end

  def create
		if user_signed_in?
			@exam = Exam.new
			# @question

			pp params
			
			# 初期化
			i = 0	
			#begin
				Exam.transaction do
					while !params[:question][i.to_s].nil?
						@exam.questionNum = (i + 1)
						i += 1
					end
	
					# 2桁までしか入力できないので、制限時間無制限の場合、3桁の100を代入
					@exam.min = params[:exam][:min] != "" ? params[:exam][:min].to_i : 100
					@exam.sec = params[:exam][:sec] != "" || params[:exam][:sec] == "0" ? params[:exam][:sec].to_i : 100	
					@exam.title = params[:exam][:title]
					@exam.user = current_user.id
					@exam.save
	
					# テストのセーブ
					# pp @exam.save
					# pp "TequestionNumst = ", @exam
					# pp "b"

					i = 0
					while !params[:question][i.to_s].nil?
            @question = @exam.questions.new
						@question.kind = params[:question][i.to_s][:kind]
						@question.sub_kind = params[:question][i.to_s][:kind] == "1" ? params[:question][i.to_s][:sub_kind] : 0
						@question.body = params[:question][i.to_s][:body]
						# pp @question
						@question.question_id = (i + 1)

						# 問題のセーブ
						@question.save
					
						# pp "Question = ", @question
			
						case params[:question][i.to_s][:kind]
						when "1"
							j = 0
	
							while !params[:question][i.to_s][:choices][j.to_s].nil?
								# 選択肢の代入
								@choice = @question.choices.new
								@choice.choice_text = params[:question][i.to_s][:choices][j.to_s][:choice_text]
								@choice.right = params[:question][i.to_s][:choices][j.to_s][:right] ? true : false
								@choice.exam_id = @exam.id
								@choice.question_id = @question.question_id
								@choice.choice_id = (j+1)
								pp @choice

								@choice.save!
								pp @choice

								j += 1
							end
            # ○×問題
						when "2"		
							#p @choice
							@choice = @question.choices.build
							@choice.choice_text = ""
							@choice.right = params[:question][i.to_s][:choices]["0"][:right] ? true : false
					
							@choice.exam_id = @exam.id
							@choice.question_id = @question.question_id
							@choice.choice_id = 1

							@choice.save!
            # 一問一答
						when "3"
							@choice = @question.choices.build
							@choice.choice_text = params[:question][i.to_s][:choices]["0"][:choice_text]
							@choice.right = "t"

							@choice.exam_id = @exam.id
							@choice.question_id = @question.question_id
							@choice.choice_id = 1
	
							@choice.save!
            # 穴埋め
            when "4"
              params[:question][i.to_s][:body].scan(/#\{.+\}/).size.times do |choice_i|
                @choice = @question.choices.new
                @choice.choice_text = params[:question][i.to_s][:body].scan(/#\{.+\}/)[choice_i]
                @choice.right = "t"

                @choice.exam_id = @exam.id
  							@choice.question_id = @question.question_id
                @choice.choice_id = choice_i+1
                @choice.save!
              end
            end
						i += 1
					end
					redirect_to :action => "index"
				end
			#rescue => e
			#	render :text => "エラーが発生しました。"
			#end
		else 
			render :text => "ログインしてください。"
		end
	end

  def index
		# pp Exam.find(:all, {:include => :exam_questions})[0].exam_questions
		@exams = Exam.find(:all, {:include => :questions, :conditions => {"questions.question_id" => 	1}})
		# pp @exams
  end

  def edit
		@exam = params(params[:id])
  end

  def destroy
		@exam = Exam.find(params[:id])
		if current_user.id == @exam.user
			@exam.destroy
			redirect_to "/exam/index"
		else
			render :text => "作成ユーザーでない為、削除する事は出来ません。"
 		end
  end

	def show
		@exam = Exam.find(:all, :include => :questions, :conditions => {"questions.exam_id" => params[:id]})
		pp "@exam = ", @exam
	end

	def check
		@exam = Exam.find(:all, :include => :questions, :conditions => {"questions.exam_id" => params[:id]})
		@exam[0].update_attribute(:updated_at, Time.now)
		pp @exam
	end
end

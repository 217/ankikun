# coding: utf-8
# デバッグ用
# 一応require
require 'pp'
#require 'awesome_print'

class ExamController < ApplicationController
private
  def login?
    unless user_signed_in?
      render :text => "ログインしてください。"
    end
  end

	def session_exist?
		pp session[:true_question]
		pp session[:question_num]

		if session[:true_question].nil? and session[:question_num].nil?
			render :text => "問題の履歴がありません。"
		end
	end
public
  before_filter :login?, :only => ["new","create","record"]
	before_filter :session_exist?, :only => "record"

  def new
		@exam = Exam.new
		@questions = [@exam.questions.new]
  end

  def create
    # 初期化
    i = 0	
    begin
      Exam.transaction do
        @exam = Exam.new(
                         :min => params[:exam][:min] != "" ? params[:exam][:min].to_i : 100,
                         :sec => params[:exam][:sec] != "" || params[:exam][:sec] == "0" ? params[:exam][:sec].to_i : 100,
                         :title => params[:exam][:title],
                         :user => current_user.id
                        )
        while !params[:question][i.to_s].nil?
          @exam.questionNum = (i + 1)
          i += 1
        end
        @exam.save!

        #q = QuestionParametar.new(parames[:exam])	 _#Active::Model 参照
        #if q.valid?
        # 2桁までしか入力できないので、制限時間無制限の場合、3桁の100を代入
        
        i = 0
        while !params[:question][i.to_s].nil?
          @question = @exam.questions.create!(
                                      :kind => params[:question][i.to_s][:kind],
                                      :sub_kind => params[:question][i.to_s][:kind] == "1" ? params[:question][i.to_s][:sub_kind] : 0,
                                      :body => params[:question][i.to_s][:body],
                                      :question_id => (i+1)
                                      )
          case params[:question][i.to_s][:kind]
          when "1"
            j = 0

            while !params[:question][i.to_s][:choices][j.to_s].nil?
              choice_params = params[:question][i.to_s][:choices][j.to_s]
              # 選択肢の代入
              ################################
              # @question を、@いらない
              #############################
              @question.choices.create!(
                                        :choice_text => choice_params[:choice_text],
                                        :right => choice_params[:right] ? true : false,
                                        :exam_id => @exam.id,
                                        :choice_id => (j+1)
                                        )
              j += 1
            end
          # ○×問題
          when "2"		
            #p @choice
            @question.choices.build(
                                    :choice_text => "",
                                    :right => params[:question][i.to_s][:choices]["0"][:right] ? true : false,
                                    :exam_id => @exam.id,
                                    :question_id => @question.question_id,
                                    :choice_id => 1
                                    ).save!
          # 一問一答
          when "3"
            @question.choices.build(
                                    :choice_text => params[:question][i.to_s][:choices]["0"][:choice_text],
                                    :right => "t",
                                    :exam_id => @exam.id,
                                    :choide_id => 1
                                    ).save!
          # 穴埋め
          when "4"
            params[:question][i.to_s][:body].scan(/#\{[^\}]+\}/).size.times do |choice_num|
              @question.choices.build(
                                    :choice_text => params[:question][i.to_s][:body].scan(/#\{[^\}]+\}/)[choice_num],
                                    :right => "t",
                                    :exam_id => @exam.id,
                                    :choice_id => choice_num
                                    ).save!
            end
          end
          i += 1
        end
        redirect_to :action => "index"
      end
    # 本当はこれをつける
    # rescue => e
    # render :text => "エラーが発生しました。"
    end
	end

  def index
		@exams = Exam.find(:all, {:include => :questions, :conditions => {"questions.question_id" => 	1}})
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
		@exam = Exam.includes(:questions).find(params[:id])
	end

	def check
		@exam = Exam.includes(:questions).find(params[:id])
		@exam.update_attribute(:updated_at, Time.now)
	end

	def record
		Record.create!(
										:trueQuestion => session[:true_question],
										:questionNum => session[:question_num]
									)
		# reset_sessionを使うと、Deviseまでログアウトされる
		session[:true_question] = session[:question_num] = nil
	end
end

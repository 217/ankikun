class TestController < ApplicationController
  def new
		@test = Test.new
		@questions = @test.question.build
  end

  def create
		@questions = Question.new(params[:questions]);
		# render :text => ""
  end

  def index

  end

  def edit
		@test = Test.new
  end

  def destroy

  end
end

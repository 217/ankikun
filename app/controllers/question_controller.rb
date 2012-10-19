class QuestionController < ApplicationController
  def index
  end

  def new
		@question = Question.new
  end

  def create
  end

  def destroy
  end
end

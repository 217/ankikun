class TestController < ApplicationController
  def new
		@test = Test.new
  end

  def create
		@test = Test.new(params[:tests]);
		# render :text => ""
  end

  def index

  end

  def edit

  end

  def destroy

  end
end

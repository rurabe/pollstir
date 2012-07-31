class QuestionsController < ApplicationController
  
  before_filter :look_up_poll
  before_filter :look_up_question, only: [:edit, :update, :destroy]
    
  def new
    @question = Question.new
  end
  
  def create
    @question = @poll.questions.new(params[:question])
    if @question.save
      redirect_to edit_poll_path(@poll.edit_url)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @question.update_attributes(params[:question])
    if @question.save
      redirect_to edit_poll_path(@poll.edit_url)
    else
      render :edit
    end
  end
  
  def destroy
    @question.destroy
    redirect_to edit_poll_path(@poll.edit_url)
  end
  
  private
  
    def look_up_poll
      @poll = Poll.find_by_id(params[:poll_id])
    end
    
    def look_up_question
      @question = Question.find_by_id(params[:id])
    end
end

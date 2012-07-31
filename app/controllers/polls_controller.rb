class PollsController < ApplicationController
  def index
    @polls = Poll.all
  end

  def new
    @poll = Poll.new
  end
  
  def create
    @poll = Poll.new(params[:poll])
    if @poll.save
      flash[:notice] = render_to_string(partial: 'shared/flash_poll_success')
      redirect_to poll_path(@poll)
    else
      render :new
    end
  end
  
  def update
    @poll = Poll.find_by_id(params[:id])
    if @poll.update_attributes(params[:poll])
      redirect_to poll_path(@poll)
    else
      redirect_to edit_poll_path(@poll.edit_url)
    end
  end
  
  def show
    @poll = Poll.find_by_id(params[:id])
    @questions = @poll.questions
    @editable = false
  end

  def edit
    @poll = Poll.find_by_edit_url(params[:id])
    @questions = @poll.questions
    @editable = true
  end
  

end

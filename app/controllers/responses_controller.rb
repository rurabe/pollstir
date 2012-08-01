class ResponsesController < ApplicationController
  def new
  	# FIXME: What happens if we pass in an invalid slug?
  	# How do we deal with the nil case?
  	# TODO: Look up how to make this throw the right exception instead

  	@poll = Poll.find_by_public_url(params[:slug])
  	@questions = @poll.questions
  	@response = @poll.responses.build
  	@poll.questions.each do |q|
  		@response.answers.build(:question => q)
  	end
  end

  def create
  	@poll = Poll.find(params[:poll_id])
  	@poll.responses.build(params[:response])

  	if @poll.save
  		flash[:notice] = "Thanks for responding!"
      redirect_to root_path
  	else
  		render :new
  	end
  end
end

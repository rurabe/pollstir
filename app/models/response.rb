class Response < ActiveRecord::Base
  belongs_to :poll
  has_many :answers

  accepts_nested_attributes_for :answers
  attr_accessible :answers_attributes

  # before_save :validates_answers

  private
  def validates_answers
  	# self.poll.questions.mandatory.all? do |q|
  	# 	# make sure we have an answer corresponding to this question
  	# end
  end
end

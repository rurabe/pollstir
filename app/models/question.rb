class Question < ActiveRecord::Base
  attr_accessible :prompt, :type, :poll_id
  
  belongs_to :poll
  has_many :answers

  validates :prompt, :presence => true
end

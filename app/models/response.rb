class Response < ActiveRecord::Base
  attr_accessible :references
  
  belongs_to :poll
  has_many :answers
end

class Answer < ActiveRecord::Base
  belongs_to :response
  belongs_to :question
  attr_accessible :body
end

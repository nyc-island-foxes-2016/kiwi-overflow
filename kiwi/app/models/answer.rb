class Answers < ApplicationController
  belongs_to :user
  belongs_to :question

  validates_presence_of :content, :user, :question
end
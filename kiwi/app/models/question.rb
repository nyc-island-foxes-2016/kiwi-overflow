class Question < ActiveRecord::Base
  include Votable

  belongs_to :user
  has_many :answers
  has_many :answer_votes, through: :answers, source: :votes
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  #validate object in preference to id
  validates_presence_of :title, :content, :user

  def comments_by_recency
    comments.order(created_at: :desc)
  end

  def best_answer
    #move the knowledge of the internals of Answer into Answer
    Answer.best_for_question(self)
  end

  def sort_answers_by_votes
    # We can do this (honestly....) in AR
    answers.joins(:votes).group(:id).order('sum(votes.direction)')
  end

end

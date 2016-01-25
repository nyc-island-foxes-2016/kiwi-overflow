class Question < ActiveRecord::Base
  include Votable

  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates_presence_of :title, :content, :user_id

  def best_answer
    Answer.find_by(id: self.best_answer_id)
  end

  def sort_answers_by_votes
    self.answers.sort_by { |answer| answer.sum_of_votes }.reverse
  end

end

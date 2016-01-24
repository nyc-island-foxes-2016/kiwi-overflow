class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates_presence_of :content, :user, :question

  def sum_of_votes
    self.votes.inject(0){|sum, vote| sum += vote.direction}
  end

end

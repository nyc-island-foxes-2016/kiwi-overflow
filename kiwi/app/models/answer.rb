class Answer < ActiveRecord::Base
  include Votable

  belongs_to :user
  belongs_to :question

  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates_presence_of :content, :user, :question

end

class Question < ActiveRecord::Base
  include Votable

  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates_presence_of :title, :content, :user_id
end

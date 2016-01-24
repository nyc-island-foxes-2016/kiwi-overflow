class Vote < ActiveRecord::Base

  belongs_to :user
  belongs_to :votable, polymorphic: true

  validates :direction, presence: true
  validates_inclusion_of :direction, :in => [-1, 1], :allow_nil => true

end

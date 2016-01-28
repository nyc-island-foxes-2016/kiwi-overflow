#I'd rename this to avoid confusion with the association name
module Votable
  #Let the database do this stuff
  def sum_of_votes
    votes.sum(:direction)
  end

  def already_voted?(user)
    self.votes.where(user: user).count > 0
  end

end

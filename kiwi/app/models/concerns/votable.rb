module Votable
  def sum_of_votes
    self.votes.inject(0){|sum, vote| sum += vote.direction}
  end

  def voted?
    binding.pry
    self.votes.find_by(user_id: user_id)
  end

end

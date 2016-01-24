class VotesController < ApplicationController

  def create
    binding.pry
    @vote = Vote.new(vote_params)
    if @vote.save
      redirect_to question_path(id: @vote.question_id)
    else
      redirect_to login_path
    end
  end

private

def vote_params
  params.require(:vote).permit(:direction,:user_id, :question_id)
end


end
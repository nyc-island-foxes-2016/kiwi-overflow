class VotesController < ApplicationController
  before_action :load_votable

  def create
    @vote = current_user.votes.new(vote_params)
    if !!params[:question_id]
      @vote.votable_type = "Question"
      @vote.votable_id = params[:question_id]
      @vote.save
      redirect_to question_path(id: @vote.votable_id)
    elsif !!params[:answer_id]
      @vote.votable_type = "Answer"
      @vote.votable_id = params[:answer_id]
    else
      @vote.votable_type = "Comment"
      @vote.votable_id = params[:comment_id]
    end
  end

private

def vote_params
  params.require(:vote).permit(:direction,:user_id)
end

def load_votable
  # binding.pry
    resource, id = request.path.split('/')[1,2]
    @votable = resource.singularize.classify.constantize.find(id)
end


end
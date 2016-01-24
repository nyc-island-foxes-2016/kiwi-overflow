class VotesController < ApplicationController

  def create
    @vote = current_user.votes.new(vote_params)
      binding.pry
    if !!params[:question_id] && Question.find(params[:question_id]).voted?
      @vote.votable_type = "Question"
      @vote.votable_id = params[:question_id]
      @vote.save
      redirect_to question_path(id: @vote.votable_id)
    elsif !!params[:answer_id]
      @vote.votable_type = "Answer"
      @vote.votable_id = params[:answer_id]
      @answer = Answer.find_by(id: params[:answer_id])
      @vote.save
      redirect_to question_path(id: @answer.question_id)
    else
      @vote.votable_type = "Comment"
      @vote.votable_id = params[:comment_id]
      @vote.save
      redirect_to question_path(id: @comment.question_id)
    end
  end

private

def vote_params
  params.require(:vote).permit(:direction,:user_id)
end

# def vote_type
#   if !!params[:question_id]
#       @vote_type = {votable_type: "Question" , votable_id: params[:question_id]}
#     elsif !!params[:answer_id]
#       @vote_type = {votable_type: "Answer" , votable_id: params[:answer_id]}
#     else
#       @vote_type = {votable_type: "Comment" , votable_id: params[:comment_id]}
#     end
# end


end

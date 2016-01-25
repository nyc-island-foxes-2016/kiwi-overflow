class VotesController < ApplicationController

  def create
    @vote = current_user.votes.new(vote_params)
    if !!params[:question_id]
      @question = Question.find(params[:question_id])
      if !@question.votes.find_by(user_id: current_user)
        @vote.votable_type = "Question"
        @vote.votable_id = params[:question_id]
        @vote.save
        redirect_to question_path(id: @vote.votable_id)
      else
        @question.votes.find_by(user_id: current_user).destroy()
        @vote.votable_type = "Question"
        @vote.votable_id = params[:question_id]
        @vote.save
        redirect_to question_path(id: @vote.votable_id)
      end
    elsif !!params[:answer_id]
      @answer = Answer.find_by(id: params[:answer_id])
      if !@answer.votes.find_by(user_id: current_user)
        @vote.votable_type = "Answer"
        @vote.votable_id = params[:answer_id]
        @vote.save
        redirect_to question_path(id: @answer.question_id)
      else
        @answer.votes.find_by(user_id: current_user).destroy()
        @vote.votable_type = "Answer"
        @vote.votable_id = params[:answer_id]
        @vote.save
        redirect_to question_path(id: @answer.question_id)
      end

    else
      @vote.votable_type = "Comment"
      @vote.votable_id = params[:comment_id]
      @vote.save
      redirect_to question_path(id: @comment.question_id)
    # end
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

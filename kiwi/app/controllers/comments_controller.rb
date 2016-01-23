class CommentsController < ApplicationController

  def new
    @question = Question.find_by(id: params[:question_id])
    @comment = @question.comments.new
  end

  def create
    binding.pry
    if params[:question_id]
      question = Question.find_by(id: params[:question_id])
      @comment = question.comments.new(user: current_user, content: params[:comment][:content])
    else
      answer = Answer.find_by(id: params[:answer_id])
      @comment = answer.comments.new(user: current_user, content: params[:comment][:content])
    end
    if @comment.save
      redirect_to question_path(id: @comment.commentable_id)
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find_by(id: params[:id])
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    if @comment.update_attributes(comment_params)
      redirect_to
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    redirect_to questions_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :commentable_type, :commentable_id, :user_id)
  end

end
class CommentsController < ApplicationController

  def new
    @question = Question.find_by(id: params[:question_id])
    @comment = @question.comments.new
  end

  def create
    @commentable = Question.find_by(id: params[:id])
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to question_path(id: @commentable_id)
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
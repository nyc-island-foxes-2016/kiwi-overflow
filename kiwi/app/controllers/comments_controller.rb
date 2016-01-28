class CommentsController < ApplicationController

  def new
    if params[:question_id]
      @commentable = Question.find_by(id: params[:question_id])
    else
      @commentable = Answer.find_by(id: params[:answer_id])
    end
      @comment = @commentable.comments.new
  end

=begin

question_comments POST /questions/:question_id/comments(.:format) comments#create
answer_comments   POST /answers/:answer_id/comments(.:format) comments#create

you could do something like 
  http://stackoverflow.com/questions/23088709/finding-parent-in-rails-polymorphic-association

def find_commentable
 resource, id = request.path.split('/')[1, 2]
 @commentable = resource.singularize.classify.constantize.find(id)
end

It's a bit clever-clever but makes life simpler if you ever make something else commentable

=end

  def create
    if params[:question_id]
      question = Question.find_by(id: params[:question_id])
      @comment = question.comments.new(user: current_user, content: params[:comment][:content])
    else
      answer = Answer.find_by(id: params[:answer_id])
      @comment = answer.comments.new(user: current_user, content: params[:comment][:content])
    end
    if @comment.save
      redirect_to_question_path
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find_by(id: params[:id])
    @question = Question.find_by(id: @comment.commentable_id)
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    if @comment.update(content: params[:comment][:content])
      redirect_to_question_path
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    redirect_to_question_path
  end

  private

    def comment_params
      # Don't accept user_id  as a param from the browser - can be forged
      params.require(:comment).permit(:content, :commentable_type, :commentable_id).merge(user: current_user)
    end

    def redirect_to_question_path
      if @comment.commentable_type == "Question"
        redirect_to question_path(id: @comment.commentable_id)
      else
        redirect_to question_path(id: @comment.commentable.question_id)
      end
    end

end
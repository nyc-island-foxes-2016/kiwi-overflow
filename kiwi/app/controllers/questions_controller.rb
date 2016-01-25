class QuestionsController < ApplicationController

  def index
    if params[:sort] == "trend"

    elsif params[:sort] == "recent"
      @questions = Question.all.order(:created_at)
    elsif params[:sort] == "rate"
      @questions = Question.all.sort_by { |question| question.sum_of_votes }.reverse
    else
      @questions = Question.all
    end
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
      redirect_to question_path(id: @question.id)
    else
      render :new
    end
  end

  def show
    @question = Question.includes(:answers, :user).find(params[:id])
    @question.increment(:views)
    @question.save
    @answers = @question.sort_answers_by_votes
    @answer = Answer.new
  end

  def edit
    @question = Question.find_by(id: params[:id])
  end

  def update
    @question = Question.find_by(id: params[:id])
    if @question.update_attributes(question_params)
      redirect_to question_path
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find_by(id: params[:id])
    @question.destroy
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:title,:content,:user_id,:best_answer_id)
  end
end

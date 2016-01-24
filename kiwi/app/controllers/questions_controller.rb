class QuestionsController < ApplicationController

  # before_filter

  def index
    @questions = Question.all
    if params[:sort] == "trending"

    elsif params[:sort] == "most-recent"
      @question = @questions.order(:created_at)
    elsif params[:sort] == "rate"
      binding.pry
      @question = @questions.sort_by { |question| question.votes.count }.reverse
    else

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

class AnswersController < ApplicationController
  add_flash_types(:alert)

  def create
    @answer = Answer.new(answer_params)
    if request.xhr?
       if @answer.save
        render partial: "answers/answer_show", layout: false, locals: { answer: @answer}
      end
    else
      if @answer.save
        redirect_to question_path(id: @answer.question_id)
      else
        @errors = @answer.errors.full_messages
        redirect_to question_path(id: @answer.question_id)
      end
    end
  end

  def best
    # binding.pry
    @answer = Answer.find_by(id: params[:id])
    @answer.question.update(best_answer_id: @answer.id)
    redirect_to question_path(id: @answer.question_id)
  end

  private

  def answer_params
    params.require(:answer).permit(:content,:user_id,:question_id)
  end

end

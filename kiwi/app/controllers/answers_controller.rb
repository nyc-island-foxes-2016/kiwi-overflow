class AnswersController < ApplicationController
  add_flash_types(:alert)

  def create
    @answer = Answer.new(answer_params)
    binding.pry
    if @answer.save
      if request.xhr?
        render question_path(id: @answer.question_id), layout: false, locals: { answer: @answer }
      else
        redirect_to question_path(id: @answer.question_id)
      end
    else
      @errors = Answer.errors.full_messages
      redirect_to question_path(id: @answer.question_id)
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content,:user_id,:question_id)
  end

end

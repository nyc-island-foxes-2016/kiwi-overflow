class AnswersController < ApplicationController
add_flash_types(:alert)
def create
  @answer = Answer.new(answer_params)
  if @answer.save
    redirect_to question_path(id: @answer.question_id)
  else
    #error to be handled by ajax
    redirect_to login_path
  end
end

private

def answer_params
  params.require(:answer).permit(:content,:user_id,:question_id)
end

end
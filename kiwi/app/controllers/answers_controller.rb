class AnswersController < ApplicationController

def new
  @answer = Answer.new
end

def create
  binding.pry
  @answer = Answer.new(answer_params)
  if @answer.save
    redirect_to question_path(id: @answer.question_id)
  else
    alert("An Error has Occurred!")
  end
end

private

def answer_params
  params.require(:answer).permit(:content,:user_id,:question_id)
end

end
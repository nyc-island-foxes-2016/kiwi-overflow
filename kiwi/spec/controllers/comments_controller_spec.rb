require 'rails_helper'

describe CommentsController do


  describe "#new" do
    it "renders a form to create a new comment on a question" do
      question = FactoryGirl.create(:question)
      get :new, question_id: question.id
      expect(response).to render_template :new
    end
  end

  # describe "#new" do
  #   it "renders a form to create a new comment on an answer" do
  #     answer =
  # end



end

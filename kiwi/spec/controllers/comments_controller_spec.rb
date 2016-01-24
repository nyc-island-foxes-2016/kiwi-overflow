require 'rails_helper'

describe CommentsController do

  let(:user1)     { FactoryGirl.create :user }
  let(:user2)     { FactoryGirl.create :user }
  let(:question)  { FactoryGirl.create :question, user: user1 }
  let(:answer)    { FactoryGirl.create :answer, question: question, user: user2}


  describe "#new" do
    it "renders a form to create a new comment on a question" do
      get :new, question_id: question.id
      expect(response).to render_template :new
    end

    it "renders a form to create a new comment on an answer" do
      get :new, answer_id: answer.id
      expect(response).to render_template :new
    end
  end

  describe "#create" do
    context "with valid attributes" do

      it "creates a new comment to a question" do
        expect do
          post :create, comment: {
            content: "This is a comment.",
            commentable_id: question.id,
            commentable_type: question.class,
            user: user2
          }
        end
      end

      it "creates a new comment to an answer" do
        expect do
          post :create, comment: {
            content: "This is a comment.",
            commentable_id: answer.id,
            commentable_type: answer.class,
            user: user2
          }
        end
      end

    end
  end

end

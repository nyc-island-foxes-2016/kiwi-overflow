require 'rails_helper'

  describe QuestionsController do

    it "#index" do
      get :index
      expect(assigns(:questions)).to eq Question.all
    end

    it "#new" do
      get :new
    end

    context "#create" do

      it "creates a question with valid params" do
      post :create, question: {title: "valid", content: "this is content"}
      expect(Question.find(assigns[:question].id)).to be true
      end

      it "doesn't create a question when params are invalid" do
        post :create, question: {title: "invalid", content: ""}
        expect(Question.find(assigns[:question].id)).to be false
      end
    end


end
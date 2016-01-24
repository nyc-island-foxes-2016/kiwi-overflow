require 'rails_helper'

  describe QuestionsController do

    describe 'GET #index' do

      it "populates an array of questions" do
        user = FactoryGirl.create(:user)
        question = FactoryGirl.create(:question, user: user)
        get :index
        expect(assigns(:questions)).to eq([question])
      end

      it "renders the :index view" do
        get :index
        expect(response).to render_template :index
      end

    end

    describe "GET #show" do

      it "assigns the requested question to @question" do
        user = FactoryGirl.create(:user)
        question = FactoryGirl.create(:question, user: user)
        get :show, id: question
        expect(assigns(:question)).to eq(question)
      end

      it "renders the #show view" do
        user = FactoryGirl.create(:user)
        get :show, id: FactoryGirl.create(:question, user: user)
        expect(response).to render_template :show
      end

    end

#Still Working on pending tests below

    describe "POST create" do

      context "with valid attributes" do

        xit "creates a new question" do
          post :create, question: {title: "Title", Content: "Content", user_id: 1 }
          expect(assigns(:question)).to change(Question, :count).by(1)
        end

        xit "redirects to the new question" do
            post :create, question: FactoryGirl.attributes_for(:question)
            expect(response).to redirect_to Question.last
        end

    end

        context "with invalid attributes" do
          xit "does not save the new question" do
            expect{
              post :create, question: FactoryGirl.attributes_for(:question)
              }.to_not change(Question, :count)
            end

            xit "re-renders the new method" do
              post :create, question: FactoryGirl.attributes_for(:question)
              expect(response).to render_template :new
            end
          end
        end


end

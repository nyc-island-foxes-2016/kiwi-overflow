require 'rails_helper'

  describe QuestionsController do

    describe 'GET #index' do 

      it "populates an array of questions" do
        question = FactoryGirl.create(:question)
        get :index
        expect(assigns(:questions)).to eq([question])
      end

    end


end
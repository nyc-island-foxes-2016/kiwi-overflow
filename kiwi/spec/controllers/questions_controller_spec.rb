require 'rails_helper'

  describe QuestionsController do

    it "#index" do
      get :index
      expect(assigns(:questions)).to eq Question.all
    end




end
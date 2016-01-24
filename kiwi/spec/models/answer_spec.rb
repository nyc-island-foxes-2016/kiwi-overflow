require 'rails_helper'

describe Answer do
  let(:user) { FactoryGirl.create(:user) }
  let(:question) { FactoryGirl.create(:question, user: user) }
  let(:answer) { FactoryGirl.create(:answer, question: question, user: user) }

  it { should belong_to(:question) }

  it "has a valid factory" do
    expect(answer).to be_valid
  end

  it "is invalid without a content" do
    expect(FactoryGirl.build(:answer, content: nil)).to_not be_valid
  end

  it "is invalid without a question_id" do
    expect(FactoryGirl.build(:answer, question_id: nil)).to_not be_valid
  end

end

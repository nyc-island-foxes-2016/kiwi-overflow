require 'rails_helper'

describe Question do
  let(:user) { FactoryGirl.create(:user) }
  let(:question) { FactoryGirl.create(:question, user: user) }

  it { should belong_to(:user) }

  it "has a valid factory" do
    expect(question).to be_valid
  end

  it "is invalid without a title" do
    expect(FactoryGirl.build(:question, title: nil)).to_not be_valid
  end

  it "is invalid without a content" do
    expect(FactoryGirl.build(:question, content: nil)).to_not be_valid
  end

  it "is invalid without a user_id" do
    expect(FactoryGirl.build(:question, user_id: nil)).to_not be_valid
  end

end

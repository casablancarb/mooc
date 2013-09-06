require 'spec_helper'

describe Answer do
  context "#is_correct?" do
    let(:correct_alternative){ FactoryGirl.create :correct_alternative }
    let(:incorrect_alternative){ FactoryGirl.create :incorrect_alternative }
    let(:user){ FactoryGirl.create :user }

    it "resonds with true if the user's answer is correct" do
      correct_answer = FactoryGirl.create :answer, {
        alternative: correct_alternative,
        user: user
      }
      correct_answer.is_correct?.should == true
    end

    it "responds with false if the user's answer is not correct" do
      incorrect_answer = FactoryGirl.create :answer, {
        alternative: incorrect_alternative,
        user: user
      }
      incorrect_answer.is_correct?.should == false
    end
  end
end

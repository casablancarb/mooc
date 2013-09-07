require 'spec_helper'

describe Question do
  let(:question){ FactoryGirl.create :question }
  let(:user){ question.exercise.section.course.user }
  let(:alternative){ question.alternatives.first }

  context "#answer_from_user" do
    let(:another_user){ FactoryGirl.create :user }

    it "responds with the answer given by the user" do
      answer = FactoryGirl.create :answer, {
        alternative: alternative,
        user: user
      }
      question.answer_from_user(user).should == answer
    end

    it "does not respond with an answer given by another user" do
      answer = FactoryGirl.create :answer, {
        alternative: alternative,
        user: user
      }
      question.answer_from_user(another_user).should_not == answer
    end
  end

  context "#is_correctly_answered_by_user?" do
    it "responds with true if the question is correctly answered by the user" do
      alternative.truth_value = true
      alternative.save!
      answer = FactoryGirl.create :answer, {
        alternative: alternative,
        user: user
      }
      question.is_correctly_answered_by_user?(user).should == true
    end

    it "responds with false if the question is incorrectly answered by the user" do
      alternative.truth_value = false
      alternative.save!
      answer = FactoryGirl.create :answer, {
        alternative: alternative,
        user: user
      }
      question.is_correctly_answered_by_user?(user).should == false
    end

    it "does not confuse thev value with another user"do
    end
  end
end

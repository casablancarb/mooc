require 'spec_helper'

describe Question do
  let(:question){ FactoryGirl.create :question }
  let(:user){ question.exercise.section.course.user }
  let(:alternative){ question.alternatives.first }
  let(:another_user){ FactoryGirl.create :user }

  context "#answer_from_user" do
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

    it "responds with false if the question is correctly answered by another user, but not this one" do
      alternative.truth_value = true
      alternative.save!
      answer = FactoryGirl.create :answer, {
        alternative: alternative,
        user: FactoryGirl.create(:user)
      }
      question.is_correctly_answered_by_user?(user).should == false
    end

    it "responds with false if the question is incorrectly answered by another user, but correctly by this one" do
      correct_alternative = FactoryGirl.create :correct_alternative, {question: question}
      incorrect_alternative = FactoryGirl.create :incorrect_alternative, {question: question}
      FactoryGirl.create :answer, { alternative: incorrect_alternative, user: another_user }
      FactoryGirl.create :answer, { alternative: correct_alternative, user: user }
      question.is_correctly_answered_by_user?(user).should == true
    end
  end
end

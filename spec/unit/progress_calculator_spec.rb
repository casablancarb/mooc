require 'spec_helper'

describe ProgressCalculator do
  context ".for_user_in_exercise" do
    it "returns 25 if the user has correctly answered 1/4 questions in the exercise" do
      exercise = FactoryGirl.create :exercise
      exercise.stub(:number_of_questions){ 4 }
      exercise.stub(:number_of_correctly_answered_questions_by_user){ 1 }
      ProgressCalculator.for_user_in_exercise(nil, exercise)
    end

    it "returns 0 if the user has correctly answered 0 questtions in the exercise" do
      exercise = FactoryGirl.create :exercise
      exercise.stub(:number_of_questions){ 101 }
      exercise.stub(:number_of_correctly_answered_questions_by_user){ 0 }
      ProgressCalculator.for_user_in_exercise(nil, exercise)
    end
  end
end

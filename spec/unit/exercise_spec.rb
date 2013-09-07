require 'spec_helper'

describe Exercise do
  let(:exercise){ FactoryGirl.create :exercise }

  describe "#number_of_questions" do
    it "returns the same number of questions as it has questions" do
      3.times do
        exercise.questions << FactoryGirl.create(:question, {exercise: exercise})
      end
      exercise.number_of_questions.should == 3
    end
  end

  describe "#number_of_correctly_answered_questions_by_user"

  context "#progress_for_user" do
    it "blindly delegates to ProgressCalculator" do
      user = stub
      exercise = Exercise.new
      ProgressCalculator.stub(:calculate_progress_from_questions_for_user)
      ProgressCalculator.should_receive(:calculate_progress_from_questions_for_user).with(exercise.questions, user)
      exercise.progress_for_user(user)
    end
  end
end

require 'spec_helper'

describe ExerciseDecorator do
  context "#progress" do
    it "blindly delegates to the model" do
      exercise = double
      exercise.stub(:progress_for_user)
      exercise.should_receive(:progress_for_user)
      ExerciseDecorator.decorate(exercise).progress
    end
  end
end

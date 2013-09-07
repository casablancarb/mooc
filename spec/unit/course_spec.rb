require 'spec_helper'

describe Course do
  context "#progress_for_user" do
    it "delegates to progress calculator" do
      user = stub
      course = Course.new
      ProgressCalculator.stub(:calculate_progress_from_progress_collection_for_user)
      ProgressCalculator.
        should_receive(:calculate_progress_from_progress_collection_for_user).
        with(course.sections, user)
      course.progress_for_user(user)
    end
  end
end

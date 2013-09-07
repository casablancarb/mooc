require 'spec_helper'

describe Section do
  context "#progress_for_user" do
    it "delegates to progress calculator, sending only published exercises" do
      user = stub
      section = Section.new
      ProgressCalculator.stub(:calculate_progress_from_progress_collection_for_user)
      ProgressCalculator.
        should_receive(:calculate_progress_from_progress_collection_for_user).
        with(section.published_exercises, user)
      section.progress_for_user(user)
    end
  end
end

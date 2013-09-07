require 'spec_helper'

describe CourseDecorator do
  context "#progress" do
    it "delegates to the course model" do
      decorator = Course.new.decorate
      decorator.stub(:current_user){ 'Jane' }

      ProgressCalculator.
        should_receive(:calculate_progress_from_progress_collection_for_user).
        with(decorator.sections, decorator.current_user)

      decorator.progress
    end
  end
end

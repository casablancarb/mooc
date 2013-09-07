require 'spec_helper'

describe CourseDecorator do
  context "#progress" do
    it "delegates to the progress calculator" do
      decorator = CourseDecorator.new(nil)
      decorator.stub(:current_user){ 'Jane' }
      decorator.stub(:sections){ ['Sections'] }
      ProgressCalculator.stub(:calculate_progress_from_progress_collection_for_user)

      ProgressCalculator.should_receive(:calculate_progress_from_progress_collection_for_user).with(['Sections'], 'Jane')

      decorator.progress
    end
  end
end

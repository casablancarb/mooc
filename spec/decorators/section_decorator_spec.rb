require 'spec_helper'

describe SectionDecorator do
  context "#progress" do
    it "delegates to the progress calculator" do
      decorator = SectionDecorator.new(nil)
      decorator.stub(:current_user){ 'Jane' }
      decorator.stub(:exercises){ ['Exercises'] }
      ProgressCalculator.stub(:calculate_progress_from_progress_collection_for_user)

      ProgressCalculator.should_receive(:calculate_progress_from_progress_collection_for_user).with(['Exercises'], 'Jane')

      decorator.progress
    end
  end
end

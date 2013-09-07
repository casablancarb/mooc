require File.expand_path('app/models/progress_calculator')

describe ProgressCalculator do
  context ".calculate_progress_from_progress_collection_for_user" do
    it "calculates the progress" do
      stubs = []
      values = [100, 50, 50, 100]
      values.each do |value|
        stubs << double
        stubs.last.stub(:progress_for_user){ value }
      end
      ProgressCalculator.calculate_progress_from_progress_collection_for_user(stubs, stub).should == 75
    end
  end
end

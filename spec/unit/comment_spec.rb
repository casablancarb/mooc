require 'spec_helper'

describe Comment do
  context "#valid?" do
    it "returns true of it is valid" do
      comment = FactoryGirl.build :comment
      comment.should be_valid
    end

    it "returns false if it isn't valid" do
      comment = FactoryGirl.build :invalid_comment
      comment.should_not be_valid
    end
  end
end

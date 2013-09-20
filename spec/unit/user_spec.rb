require 'spec_helper'

describe User do
  context "is_teacher?" do
    it "returns true if the user is a teacher" do
      subject.stub(:is_teacher){ true }
      subject.is_teacher?.should be_true
    end

    it "returns false if the user is not a teacher" do
      subject.stub(:is_teacher){ false }
      subject.is_teacher?.should be_false
    end
  end
end

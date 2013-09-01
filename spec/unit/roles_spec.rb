require 'spec_helper'

describe User do
  describe "#is_teacher?" do
    it "is FALSE by default" do
      user = FactoryGirl.create(:user)
      user.is_teacher?.should be_false
    end

    it "responds with TRUE if the user is a teacher" do
      user = FactoryGirl.create(:user, is_teacher: true)
      user.is_teacher?.should be_true
    end

    it "responds with FALSE if the user is not a teacher" do
      user = FactoryGirl.create(:user, is_teacher: false)
      user.is_teacher?.should be_false
    end
  end
end

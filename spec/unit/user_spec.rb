require 'spec_helper'

describe User do
  context "#valid?" do
    it "is false if email is not unique" do
      first  = FactoryGirl.create :user
      second = FactoryGirl.build :user, email: first.email
      second.should_not be_valid
    end
  end

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

  context "takes_course?" do
    let(:course){ FactoryGirl.create :course }
    let(:user){ FactoryGirl.create :user }

    it "returns true if the user is admitted to the course" do
      FactoryGirl.create :admission, user:user, course:course
      user.takes_course?(course).should be_true
    end

    it "returns false if the user is not admitted to the course" do
      user.takes_course?(course).should be_false
    end
  end
end

require 'spec_helper'

describe Alternative do
  context "#is_selected_by_user?" do
    let(:question){ FactoryGirl.create :question }
    let(:user){ question.exercise.section.course.user }
    let(:first_alternative){ question.alternatives[0] }
    let(:second_alternative){ question.alternatives[1] }

    before :each do
      FactoryGirl.create :answer, { user:user, alternative:first_alternative }
      FactoryGirl.create :answer, { user:user, alternative:second_alternative }
    end

    it "should return true if it is the latest answer from the user" do
      second_alternative.is_selected_by_user?(user).should == true
    end

    it "should return false if it is not the latest answer from the user" do
      first_alternative.is_selected_by_user?(user).should == false
    end
  end
end

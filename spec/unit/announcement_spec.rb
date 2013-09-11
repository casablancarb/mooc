require 'spec_helper'

describe Announcement do
  context "#valid?" do
    let(:announcement){ FactoryGirl.create :announcement  }

    it "is valid if created through factory" do
      announcement.should be_valid
    end

    it "requires presence of title" do
      announcement.title = nil
      announcement.should_not be_valid
    end

    it "requires presence of body" do
      announcement.body = nil
      announcement.should_not be_valid
    end

    it "requires presence of course" do
      announcement.course = nil
      announcement.should_not be_valid
    end
  end
end

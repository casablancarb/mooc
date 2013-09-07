require 'spec_helper'

describe SectionDecorator do
  context "#progress" do
    it "delegates to the section model" do
      section = Section.new
      decorator = SectionDecorator.decorate section
      decorator.stub(:current_user){ 'Jane' }

      decorator.stub(:progress_for_user)
      section.should_receive(:progress_for_user).with(decorator.current_user)

      decorator.progress
    end
  end
end

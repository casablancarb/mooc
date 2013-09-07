require 'spec_helper'

describe CourseDecorator do
  context "#progress" do
    it "delegates to the course model" do
      course = Course.new
      decorator = course.decorate
      decorator.stub(:current_user){ 'Jane' }

      course.should_receive(:progress_for_user).with(decorator.current_user)

      decorator.progress
    end
  end
end

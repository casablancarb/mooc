require 'spec_helper'

describe ExercisesController do
  context "GET #show" do
    before :each do
      @exercise = FactoryGirl.create(:exercise)
      controller.stub(:authorize){ true }
    end

    it "sets the instance variable exercise" do
      get :show, id:@exercise.id
      assigns(:exercise).should == @exercise
    end

    it "sets the instance variable comment" do
      get :show, id:@exercise.id
      assigns(:comment).should be_kind_of(Comment)
    end
  end
end

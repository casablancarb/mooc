require 'spec_helper'

describe ExercisesController do
  context "GET #show" do
    before :each do
      @exercise = FactoryGirl.create(:exercise)
      controller.stub(:authorize){ true }
    end

    context "when the user can read the course" do
      before :each do
        ExercisePolicy.stub(:user_can_read?){ true }
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

    context "when the user does not have access" do
      let(:subject){ get :show, id:@exercise.id }

      before :each do
        ExercisePolicy.stub(:user_can_read?){ false }
      end

      it "returns status unauthorized" do
        subject.status.should == 401
      end

      it "does not render exercise" do
        subject.should_not render_template(:show)
      end
    end
  end
end

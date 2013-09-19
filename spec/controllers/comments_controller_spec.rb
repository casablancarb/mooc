require 'spec_helper'

describe CommentsController do
  context "POST #create" do
    let(:exercise){ FactoryGirl.create :exercise }
    let(:user){ FactoryGirl.create(:user) }
    let(:valid_comment){ FactoryGirl.attributes_for :comment }
    let(:invalid_comment){ FactoryGirl.attributes_for :invalid_comment }

    before :each do
      controller.stub(:current_user){ user }
    end

    context "from a user who has access" do
      before :each do
        Admission.create(course:exercise.section.course, user:user)
      end

      context "given valid attributes" do
        subject{ post :create, exercise_id:exercise.id, comment:valid_comment }

        it "creates a comment" do
          expect{ subject }.to change{ Comment.count }.by 1
        end

        it "assigns the correct dependencies" do
          subject
          assigns(:comment).exercise.should == exercise
          assigns(:comment).user.should == user
        end
      end

      context "giving invalid attributes" do
        subject{ post :create, exercise_id:exercise.id, comment:invalid_comment }

        it "does not create a comment when given invalid attributes" do
          expect{ subject }.to_not change{ Comment.count }
        end

        it "redirects to the exercise" do
          subject.should redirect_to exercise_path(exercise)
        end
      end
    end

    context "from a user without access" do
      subject{ post :create, exercise_id:exercise.id, comment:valid_comment }

      it "responds with unauthorized" do
        subject.status.should == 401
      end

      it "does not create a comment" do
        expect{ subject }.to_not change{ Comment.count }
      end
    end
  end
end

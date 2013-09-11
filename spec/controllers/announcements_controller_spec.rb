require 'spec_helper'

describe Admin::AnnouncementsController do
  let(:course){ FactoryGirl.create :course }

  before :each do
    controller.stub(:current_user){ course.user }
  end

  context "GET #new" do
    it "sets appropriate instance variables" do
      get :new, course_id: course.id
      assigns(:course).should == course
      assigns(:announcement).should be_kind_of(Announcement)
    end

    it "should render the :new template" do
      get :new, course_id: course.id
      response.code.should == '200'
      response.should render_template(:new)
    end
  end

  context "POST #create" do
    context "with valid attributes" do
      let(:announcement){ FactoryGirl.attributes_for :announcement }

      it "should redirect to admin course path" do
        post :create, course_id: course.id, announcement: announcement
        response.should redirect_to admin_course_path(course)
      end

      it "should create an annoucement when given valid attributes" do
        expect{
          post :create, course_id: course.id, announcement: announcement
        }.to change{ Announcement.count }.by(1)
      end
    end

    context "with invalid attributes" do
      let(:announcement){ FactoryGirl.attributes_for :invalid_announcement }

      it "re-renders :new" do
        post :create, course_id: course.id, announcement: announcement
        response.should render_template(:new)
      end

      it "does not create the announcement" do
        expect{ post :create, course_id: course.id, announcement: announcement }.
          to_not change{ Announcement.count }
      end
    end
  end
end


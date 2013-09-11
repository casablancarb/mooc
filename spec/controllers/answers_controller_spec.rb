require 'spec_helper'

describe AnswersController do

  describe 'POST #create' do
    let(:user){ FactoryGirl.create :user }
    let(:question){ FactoryGirl.create :question }
    let(:course){ question.exercise.section.course }
    let(:payload){
      {
        user_id: user.id,
        alternative_id: question.alternatives.first.id
      }
    }

    before :each do
      controller.stub(:current_user){ user }
    end

    it "creates an answer if the user is admitted to the course" do
      user.admissions << FactoryGirl.create(:admission, {course:course, user:user})
      post :create, id:question.id, answer:FactoryGirl.attributes_for(:announcement)
      expect{ post :create, id:question.id, answer: payload
      }.to change{ Answer.count }.by(1)
      Answer.last.user.should == user
    end

    it "does not create an answer if the user is not admitted to the course" do
      expect{ post :create, id:question.id, answer: payload
      }.to_not change{ Answer.count }
    end

    it "does not create an answer if the exercise is not published" do
      question.exercise.published = false
      question.exercise.save!
      expect{
        post :create, id: question.id, answer: payload
      }.to_not change{ Answer.count }
    end
  end

end

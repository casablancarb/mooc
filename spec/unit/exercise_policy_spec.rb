require_relative  '../../app/models/exercise_policy.rb'

describe ExercisePolicy do
  context "#user_can_read?" do
    let(:exercise){ double.as_null_object }
    let(:user){ double }

    before :each do
      user.stub(:is_teacher?){ false }
      exercise.stub(:is_published?){ false }
    end

    context "when teacher" do
      it "returns true" do
        user.stub(:is_teacher?){ true }
        ExercisePolicy.user_can_read?(user, exercise).should be_true
      end
    end

    context "when not teacher but all other requirements fulfilled" do
      before :each do
        user.stub(:is_teacher?){ false }
        exercise.stub(:is_published?){ true }
        user.stub(:takes_course?){ true }
      end

      it "returns false if the exercise is not published" do
        exercise.stub(:is_published?){ false }
        ExercisePolicy.user_can_read?(user, exercise).should be_false
      end

      it "returns false if the user is not admitted to the course" do
        user.stub(:takes_course?){ false }
        ExercisePolicy.user_can_read?(user, exercise).should be_false
      end

      it "returns true" do
        ExercisePolicy.user_can_read?(user, exercise).should be_true
      end
    end
  end
end

class Question < ActiveRecord::Base
  belongs_to :exercise
  has_many :alternatives, inverse_of: :question
  validates_presence_of :body, :exercise_id
  accepts_nested_attributes_for :alternatives,
    reject_if: :all_blank,
    allow_destroy: true
  acts_as_list scope: :exercise

  def answer_from_user(user)
    Answer.joins(:alternative).
      merge(Alternative.joins(:question)).
      merge(Question.where(:id => id)).
      order(:id).last or NoAnswer.new
  end

  def is_readable_by?(user)
    QuestionPolicy.user_can_read?(user, self)
  end

  def is_correctly_answered_by_user?(user)
    alternative_selected_by_user(user).truth_value == true
  end

  def alternative_selected_by_user(user)
    answer_from_user(user).alternative
  end

  def self.available_to_user(user)
    joins(:exercise).
      merge(Exercise.joins(:section)).
      merge(Section.joins(:course)).
      merge(Course.joins(:admissions)).
      merge(Admission.joins(:user).where(:user_id => user.id))
  end
end

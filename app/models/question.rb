class Question < ActiveRecord::Base
  belongs_to :exercise
  has_many :alternatives, inverse_of: :question
  has_many :answers
  validates_presence_of :body, :exercise_id
  accepts_nested_attributes_for :alternatives,
    reject_if: :all_blank,
    allow_destroy: true
  acts_as_list scope: :exercise

  def self.available_to_user(user)
    joins(:exercise).
      merge(Exercise.joins(:section)).
      merge(Section.joins(:course)).
      merge(Course.joins(:admissions)).
      merge(Admission.joins(:user).where(:user_id => user.id))
  end
end

class Question < ActiveRecord::Base
  belongs_to :exercise
  has_many :alternatives, inverse_of: :question
  has_many :answers
  validates_presence_of :body, :exercise_id
  accepts_nested_attributes_for :alternatives,
    reject_if: :all_blank,
    allow_destroy: true
  acts_as_list scope: :exercise
end

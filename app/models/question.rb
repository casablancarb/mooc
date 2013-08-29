class Question < ActiveRecord::Base
  belongs_to :exercise
  has_many :alternatives
  validates_presence_of :body, :exercise_id
  accepts_nested_attributes_for :alternatives,
    reject_if: :all_blank,
    allow_destroy: true
end

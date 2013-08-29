class Alternative < ActiveRecord::Base
  belongs_to :question
  validates_presence_of :body, :truth_value, :explanation, :question_id
end

class Alternative < ActiveRecord::Base
  belongs_to :question, inverse_of: :alternatives
  validates_presence_of :body, :explanation, :question_id
end

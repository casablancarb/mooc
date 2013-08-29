class Alternative < ActiveRecord::Base
  belongs_to :question
  validates_presence_of :body, :explanation, :question_id
end

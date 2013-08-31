class Alternative < ActiveRecord::Base
  belongs_to :question, inverse_of: :alternatives
  has_many :answers
  validates_presence_of :body, :explanation, :question

  def is_selected_by_user?(user)
    question.alternative_selected_by_user(user) == self
  end
end

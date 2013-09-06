class Answer < ActiveRecord::Base
  belongs_to :alternative
  belongs_to :user

  def is_correct?
    alternative.truth_value == true
  end
end

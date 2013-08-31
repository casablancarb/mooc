class Answer < ActiveRecord::Base
  belongs_to :alternative
  belongs_to :user
end

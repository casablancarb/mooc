class Comment < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :user

  validates_presence_of :exercise, :user, :body
end

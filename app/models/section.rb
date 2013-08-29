class Section < ActiveRecord::Base
  belongs_to :course
  has_many :exercises
  validates_presence_of :title, :description
end

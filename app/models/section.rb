class Section < ActiveRecord::Base
  belongs_to :course
  has_many :exercises, order: :position
  validates_presence_of :title, :description
  acts_as_list scope: :course
end

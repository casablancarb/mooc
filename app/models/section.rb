class Section < ActiveRecord::Base
  belongs_to :course
  validates_presence_of :title, :description
end

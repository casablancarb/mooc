class Exercise < ActiveRecord::Base
  belongs_to :section
  has_many :questions
  validates_presence_of :title, :description, :video_id, :section_id
end

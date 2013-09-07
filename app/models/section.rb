class Section < ActiveRecord::Base
  belongs_to :course
  has_many :exercises, order: :position
  validates_presence_of :title, :description
  acts_as_list scope: :course

  def published_exercises
    exercises.where(:published => true)
  end

  def progress_for_user(user)
    ProgressCalculator.calculate_progress_from_progress_collection_for_user(exercises, user)
  end
end

class Course < ActiveRecord::Base
  belongs_to :user
  has_many :admissions
  has_many :sections, order: :position
  validates_length_of :semester, in: 1..2
  validates_presence_of :user, :title, :semester, :year, :admission_code
  validates_uniqueness_of :admission_code

  def owned_by? other_user
    user.id == other_user.id
  end

  def progress_for_user(user)
    ProgressCalculator.calculate_progress_from_progress_collection_for_user(sections, user)
  end

  default_scope do
    order('year ASC').order('semester ASC')
  end
end

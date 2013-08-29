class Course < ActiveRecord::Base
  belongs_to :user
  has_many :admissions
  has_many :modules
  validates_length_of :semester, in: 1..2
  validates_presence_of :user, :title, :semester, :year, :admission_code
  validates_uniqueness_of :admission_code

  def owned_by? other_user
    user.id == other_user.id
  end

  default_scope do
    order('year ASC').order('semester ASC')
  end
end

class Course < ActiveRecord::Base
  belongs_to :user
  has_many :admissions
  validates_length_of :semester, in: 1..2
  validates_presence_of :user, :title, :semester, :year

  def owned_by? other_user
    user.id == other_user.id
  end

  default_scope do
    order('year ASC').order('semester ASC')
  end
end

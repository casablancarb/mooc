class Exercise < ActiveRecord::Base
  belongs_to :section
  has_many :questions, order: :position
  validates_presence_of :title, :description, :video_id, :section_id
  acts_as_list scope: :section

  def is_readable_by?(user)
    Exercise.available_to_user(user).include? self
  end

  def self.available_to_user(user)
    joins(:section).
      merge(Section.joins(:course)).
      merge(Course.joins(:admissions)).
      merge(Admission.joins(:user).where(:user_id => user.id))
  end
end

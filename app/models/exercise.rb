class Exercise < ActiveRecord::Base
  belongs_to :section
  has_many :questions, order: :position
  has_many :comments
  validates_presence_of :title, :description, :video_id, :section_id
  validates :published, :inclusion => { :in => [true, false] }
  acts_as_list scope: :section

  def is_readable_by?(user)
    Exercise.available_to_user(user).include? self
  end

  def number_of_questions
    questions.length
  end

  def number_of_correctly_answered_questions_by_user(user)
    return 1
    questions.select{ |q| q.is_correctly_answered_by_user?(user) }.length
  end

  def progress_for_user(user)
    ProgressCalculator.calculate_progress_from_questions_for_user(questions, user)
  end

  def is_published?
    published
  end

  def self.published
    where(:published => true)
  end

  def self.available_to_user(user)
    published.joins(:section).
      merge(Section.joins(:course)).
      merge(Course.joins(:admissions)).
      merge(Admission.joins(:user).where(:user_id => user.id))
  end

  def self.find_published(id)
    exercise = where(published:true, id:id).first
    if exercise
      exercise
    else
      raise ActiveRecord::RecordNotFound
    end
  end
end

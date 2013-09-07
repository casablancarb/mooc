class ProgressCalculator
  def self.progress_to_class(progress)
    if progress < 25
      "danger"
    elsif progress < 50
      "warning"
    elsif progress < 75
      "info"
    elsif progress <= 100
      "success"
    end
  end

  def self.calculate_progress_from_progress_collection_for_user(progress_collection, user)
    return 0 if progress_collection.length < 1
    points_available_per_part = 100 / (progress_collection.length.to_f)
    points = 0
    progress_collection.each do |progress_item|
      progress_for_item = progress_item.progress_for_user(user)
      points_for_part = points_available_per_part * (progress_for_item.to_f / 100)
      points += points_for_part
    end
    points.to_i
  end

  def self.calculate_progress_from_questions_for_user(questions, user)
    total = questions.length > 0 ? questions.length : 1
    correct = questions.select{ |q| q.is_correctly_answered_by_user?(user) }.length
    (correct.to_f / total * 100).to_i
  end

  def self.for_user_in_exercise(user, exercise)
    questions = exercise.number_of_questions
    total  = questions > 0 ? questions : 1
    correct = exercise.number_of_correctly_answered_questions_by_user(user)
    (correct.to_f / total * 100).to_i
  end
end

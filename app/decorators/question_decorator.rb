class QuestionDecorator < BaseDecorator
  def alternatives
    AlternativeDecorator.decorate_collection model.alternatives
  end

  def number_of_alternatives
    model.alternatives.length
  end

  def number_of_correct_alternatives
    model.alternatives.select{ |a| a.truth_value }.length
  end
  
  def alternatives_status_class
    case number_of_alternatives
    when 0, 1
      'danger'
    when 2
      'warning'
    else
      'success'
    end
  end

  def question_status_class
    case question_status
    when 0
      'danger'
    when 1
      'warning'
    else
      'success'
    end
  end

  def ok?
    number_of_correct_alternatives >= 1
  end

  def correct_alternatives_status_class
    wrongs = number_of_alternatives - number_of_correct_alternatives
    if number_of_correct_alternatives > 0
      case wrongs
      when 0
        'danger'
      when 1
        'warning'
      else
        'success'
      end
    else
      'danger'
    end
  end

  def answer_status_class_for_user(user)
    is_correctly_answered_by_user?(user) ? 'success' : 'danger'
  end

  def explanation_for_user(user)
    answer_from_user(user).alternative.explanation
  end

  private
  
  def number_of_incorrect_alternatives
    number_of_alternatives - number_of_correct_alternatives
  end
end

class ExerciseDecorator < BaseDecorator
  def questions
    QuestionDecorator.decorate_collection model.questions
  end

  def number_of_questions
    questions.length
  end

  def contain_questions?
    questions.length > 0
  end

  def number_of_bad_questions
    questions.select{|q| q.ok? == false}.length
  end

  def number_of_ok_questions
    questions.select(&:ok?).length
  end

  def contain_bad_questions?
    questions.length > 0
  end

  def contain_ok_questions?
    questions.length > 0
  end

  def questions_status_class
    unless contain_bad_questions?
      'success'
    else
      'danger'
    end
  end

  def progress_class
    ProgressCalculator.progress_to_class(progress)
  end

  def progress
    model.progress_for_user(h.current_user)
  end

  def published_status
    published ? 'published' : 'not published'
  end

  def published_class
    published ? 'success' : 'warning'
  end

  def comments
    CommentDecorator.decorate_collection model.comments
  end

  def image
    "http://img.youtube.com/vi/#{video_id}/0.jpg"
  end

  def video_embed_url
    "//www.youtube.com/embed/#{video_id}?vq=hd1080"
  end
end

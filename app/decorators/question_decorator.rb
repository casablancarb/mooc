class QuestionDecorator < BaseDecorator
  def alternatives
    AlternativeDecorator.decorate_collection model.alternatives
  end
end

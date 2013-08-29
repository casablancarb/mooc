class AlternativeDecorator < BaseDecorator
  def truth_value_class
    if truth_value
      'icon-ok'
    else
      'icon-remove'
    end
  end

  def truth_value_color_class
    if truth_value
      'success'
    else
      'danger'
    end
  end
end

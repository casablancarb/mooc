class NoAnswer
  def alternative
    NoAlternative.new
  end

  def is_correct?
    false
  end
end

class NoAlternative
  def truth_value
    false
  end

  def explanation
    ""
  end
end

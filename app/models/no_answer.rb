class NoAnswer
  def alternative
    NoAlternative.new
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

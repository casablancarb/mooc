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
end

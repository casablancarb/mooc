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

  def self.calculateProgress(progress_collection)
    return 0 if progress_collection.length < 1
    progress = 0
    total = progress_collection.length * 100
    progress_collection.each do |s|
      progress += s.progress
    end
    (progress.to_f / total * 100).to_i
  end
end
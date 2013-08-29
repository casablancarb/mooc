class AdmissionFactory
  def self.assign_user_via_code(user, code)
    course = Course.find_by_admission_code code
    admission = Admission.new(user: user, course: course)
    admission.save
  end
end

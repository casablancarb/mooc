class Admission < ActiveRecord::Base
  belongs_to :user
  belongs_to :course

  def self.code_is_valid?(code)
    !Course.find_by_admission_code(code).nil?
  end
end

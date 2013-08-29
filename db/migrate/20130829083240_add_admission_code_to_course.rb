class AddAdmissionCodeToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :admission_code, :string
  end
end

Given(/^I enter a valid admission code$/) do
  @course ||= FactoryGirl.create :course
  fill_in 'Admission code', with: @course.admission_code
end

Given(/^I enter my personal information$/) do
  fill_in 'Firstname', with: 'John'
  fill_in 'Lastname', with: 'Doe'
  fill_in 'Email', with: 'john.doe@example.com'
  fill_in 'Password', with: '123123'
  fill_in 'Password confirmation', with: '123123'
end

Given(/^I enter an invalid admission code$/) do
  course = FactoryGirl.create :course
  fill_in 'Admission code', with: 'invalid-admission-code'
end

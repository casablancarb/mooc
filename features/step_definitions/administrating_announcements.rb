Given(/^I am the teacher of a course$/) do
  User.delete_all
  @last_course = FactoryGirl.create :course
  @last_teacher = User.find_by_email!('jane@example.com')
  @last_teacher.is_teacher = true
  @last_teacher.save!
  @last_course.user = @last_teacher
  @last_course.save!
end

Given(/^I am on the admin course page$/) do
  visit "/admin/courses/#{@last_course.id}"
end

Given(/^I fill in the announcement form$/) do
  fill_in 'Title', with: 'Attention! Something has changed!'
  fill_in 'Body', with: 'Well, this is the announcement I guess.'
end

Then(/^I should see a list of form errors$/) do
  page.should have_css('.error-messages')
end

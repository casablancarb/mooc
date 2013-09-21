Given(/^there is a course$/) do
  @last_course = FactoryGirl.create :course
end

Then(/^the page heading should be the name of the course$/) do
  page.should have_selector('h1', text: @last_course.title)
end

Given(/^I am admitted to a course$/) do
  @last_course = FactoryGirl.create :course
  FactoryGirl.create :admission, {course: @last_course, user: @last_user }
end

Then(/^I should see the course title in the list of my courses$/) do
  page.should have_selector('.list-group-item', text: @last_course.title)
end


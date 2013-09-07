Given(/^there is a course$/) do
  @course = FactoryGirl.create :course
end

Then(/^the page heading should be the name of the course$/) do
  page.should have_selector('h1', text: @course.title)
end

Given(/^that I am admitted to a course$/) do
  @course = FactoryGirl.create :course
  @user = User.find_by_email('jane@example.com')
  FactoryGirl.create :admission, {course: @course, user: @user }
end

Then(/^I should see the course title in the list of my courses$/) do
  page.should have_selector('.list-group-item', text: @course.title)
end


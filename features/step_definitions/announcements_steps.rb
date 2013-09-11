Given(/^there is an announcement$/) do
  @last_announcement = FactoryGirl.create :announcement
end

Given(/^I have access to the announcement$/) do
  FactoryGirl.create :admission, {
    course: @last_announcement.course,
    user: User.find_by_email('jane@example.com')  }
end

Then(/^I should see the announcement$/) do
  page.should have_content(@last_announcement.title)
end

Given(/^the course has an announcement$/) do
  @last_announcement = FactoryGirl.create :announcement,
    course: @last_course
end

Then(/^I should see the announcement$/) do
  page.should have_content(@last_announcement.title)
end

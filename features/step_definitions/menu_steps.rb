Given(/^I am a student$/) do
  @last_user = FactoryGirl.create :user
end

Then(/^I should not see the menu item "(.*?)"$/) do |text|
  page.should_not have_content('My teaching')
end

Given(/^I am a teacher$/) do
  @last_user = FactoryGirl.create :teacher
end

Then(/^I should see the menu item "(.*?)"$/) do |text|
  page.should have_content('My teaching')
end

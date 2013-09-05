Given(/^I have a user account$/) do
  @user = FactoryGirl.create :user
end

Given(/^I am on the home page$/) do
  visit '/'
end

Given(/^I click the menu item "(.*?)"$/) do |link|
  within(:css, '.navbar') do
    click_link link
  end
end

Given(/^I enter my credentials$/) do
  fill_in 'email', with: 'jane@example.com'
  fill_in 'password', with: '123123'
end

Given(/^I click the button "(.*?)"$/) do |name|
  click_button name
end

Then(/^I should see a successful flash saying "(.*?)"$/) do |message|
  page.find(:css, '.alert-success').text.should include(message)
end

Given(/^I enter incorrect credentials$/) do
  fill_in 'email', with: 'jane@example.com'
  fill_in 'password', with: 'incorrect-password'
end

Then(/^I should see an error flash saying "(.*?)"$/) do |message|
  page.find(:css, '.alert-error').text.should include(message)
end

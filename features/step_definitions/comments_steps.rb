Given(/^I click the "(.*?)" tab$/) do |name|
  within(:css, '.nav-tabs') do
    click_link name
  end
end

Given(/^I fill in the comment form$/) do
  fill_in 'Comment', with: 'Kittenz are cute'
end

Then(/^I should see my comment$/) do
  using_wait_time 2 do
    body.should have_text('Kittenz are cute')
  end
end

Then(/^my comment should be a student comment$/) do
  page.should have_css('.comment[data-user-role="student"]')
end

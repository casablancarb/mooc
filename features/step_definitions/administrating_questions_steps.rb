Given(/^I am the teacher of the course$/) do
  @last_course.user = @last_user
  @last_course.save!
end

Given(/^I am on the admin exercise page$/) do
  visit "/admin/sections/#{@last_exercise.section.id}/exercises/#{@last_exercise.id}"
end

Given(/^I click "(.*?)"$/) do |text|
  click_link text
end

Given(/^I fill in the question body$/) do
  fill_in 'Body', with: 'Is it true that this question has no answer?'
end

Given(/^I add one correct alternative to the question$/) do
  click_link 'add-alternative'
  within(:css, '.alternative-attributes:nth-child(1)') do
    fill_in 'Body', with: 'The correct alternative'
    fill_in 'Explanation', with: 'The reason why it is correct'
  end
end

Given(/^I add one incorrect alternative to the question$/) do
  click_link 'add-alternative'
  within(:css, '.alternative-attributes:nth-last-child(2)') do
    fill_in 'Body', with: 'The INCORRECT alternative'
    fill_in 'Explanation', with: 'The reason why it is NOT correct'
  end
end

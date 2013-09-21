Given(/^I am on the exercise page$/) do
  visit "/exercises/#{@last_exercise.id}"
end

Given(/^I fill in the feedback form$/) do
  fill_in 'Body', with: 'I think this exercise was utter BS, please rework!'
  select('1: Terrible')
end

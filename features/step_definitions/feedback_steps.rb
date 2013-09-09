Given(/^I have access to an exercise$/) do
  @last_exercise = FactoryGirl.create :exercise
  FactoryGirl.create :admission, {
    user: User.find_by_email('jane@example.com'),
    course: @last_exercise.section.course
  }
end

Given(/^I am on the exercise page$/) do
  visit "/exercises/#{@last_exercise.id}"
end

Given(/^I fill in the feedback form$/) do
  fill_in 'Body', with: 'I think this exercise was utter BS, please rework!'
  select('1: Terrible')
end

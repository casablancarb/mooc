Given(/^I am elegible to answer questions for an exercise$/) do
  @last_exercise = FactoryGirl.create :exercise
  @last_user = User.find_by_email('jane@example.com')
  FactoryGirl.create :admission, {
    course: @last_exercise.section.course,
    user: @last_user
  }

  3.times{ FactoryGirl.create :question, {exercise: @last_exercise} }
end

Given(/^I am on the section page$/) do
  visit "/sections/#{@last_exercise.section.id}"
end

Given(/^I am on the course page$/) do
  visit "/courses/#{@last_exercise.section.course.id}"
end

Given(/^I take a note of my progress$/) do
  @last_progress = page.find(:css, '.progress-value').text.chomp('%').to_i
end

Given(/^I am on the studies page$/) do
  visit '/studies'
end

Given(/^I answer a question correctly$/) do
  question = @last_exercise.questions.first
  correct_alternative = question.correct_alternatives.first
  FactoryGirl.create :answer, { alternative:correct_alternative, user:@last_user }
end

Given(/^I answer a question incorrectly$/) do
  question = @last_exercise.questions.first
  correct_alternative = question.correct_alternatives.first
  incorrect_alternative = question.alternatives.select{ |a| a != correct_alternative }.first
  FactoryGirl.create :answer, { alternative:incorrect_alternative, user:@last_user }
end

Then(/^my progress should be higher$/) do
  new_progress = page.find(:css, '.progress-value').text.chomp('%').to_i
  new_progress.should > @last_progress
end

Then(/^my progress should be lower$/) do
  new_progress = page.find(:css, '.progress-value').text.chomp('%').to_i
  new_progress.should < @last_progress
end

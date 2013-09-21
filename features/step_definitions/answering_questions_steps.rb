Given(/^I have an account$/) do
  @last_user = FactoryGirl.create :user
end

Given(/^there exist a course$/) do
  @last_course = FactoryGirl.create :course
end

Given(/^the course has (\d+) section$/) do |n|
  n.to_i.times do
    @last_section = FactoryGirl.create :section
    @last_course.sections << @last_section
  end
end

Given(/^the section has (\d+) exercise$/) do |n|
  n.to_i.times do
    @last_exercise = FactoryGirl.create :exercise
    @last_section.exercises << @last_exercise
  end
end

Given(/^the exercise has questions$/) do
  @last_question = FactoryGirl.create :question,
    exercise: @last_exercise
end

Given(/^I am admitted to the course$/) do
  FactoryGirl.create :admission,
    user: @last_user,
    course: @last_course
end

Given(/^that I am logged in$/) do
  visit '/login'
  fill_in 'email', with: @last_user.email
  fill_in 'password', with: 'password'
  click_button 'Log in'
  page.find(:css, '.alert').text.should include('Successfully logged in')
end

Given(/^a question with two answers$/) do
  @question = FactoryGirl.create :question
end

Given(/^that I have access to the course$/) do
  course = @question.exercise.section.course
  Admission.create(user: @last_user, course: course)
end

When(/^I choose the incorrect answer$/) do
  choose "answer_alternative_id_#{@last_question.alternatives[1].id}"
end

Then(/^the answer should be incorrect$/) do
  using_wait_time 2 do
    page.should have_css('div.explanation.text-danger')
    page.should_not have_css('div.explanation.text-success')
  end
end

When(/^I choose the correct answer$/) do
  choose "answer_alternative_id_#{@last_question.alternatives[0].id}"
end

Then(/^the answer should be correct$/) do
  using_wait_time 2 do
    page.should have_css('div.explanation.text-success')
    page.should_not have_css('div.explanation.text-danger')
  end
end

When(/^I reload the page$/) do
  visit current_path
end

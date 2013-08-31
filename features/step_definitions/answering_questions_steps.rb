Given(/^a question with two answers$/) do
  @question = FactoryGirl.create :question
end

Given(/^that I am logged in$/) do
  visit '/login'
  fill_in 'email', with: 'jane@example.com'
  fill_in 'password', with: '123'
  click_button 'Log in'
  page.find(:css, '.alert').text.should include('Successfully logged in')
end

Given(/^that I have access to the course$/) do
  user = User.find_by_email('jane@example.com')
  course = @question.exercise.section.course
  Admission.create(user: user, course: course)
end

Given(/^that I am on the exercise page for that question$/) do
  visit "/exercises/#{@question.exercise.id}"
end

When(/^I choose the incorrect answer$/) do
  choose "answer_alternative_id_#{@question.alternatives[0].id}"
end

Then(/^the answer should be incorrect$/) do
  using_wait_time 2 do
    page.should have_css('div.explanation.text-danger')
    page.should_not have_css('div.explanation.text-success')
  end
end

When(/^I choose the correct answer$/) do
  choose "answer_alternative_id_#{@question.alternatives[1].id}"
end

Then(/^the answer should be correct$/) do
  using_wait_time 2 do
    page.should have_css('div.explanation.text-success')
    page.should_not have_css('div.explanation.text-danger')
  end
end

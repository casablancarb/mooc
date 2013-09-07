Given(/^I am elegible to answer questions for an exercise$/) do
  @exercise = FactoryGirl.create :exercise
  @user = User.find_by_email('jane@example.com')
  FactoryGirl.create :admission, {
    course: @exercise.section.course,
    user: @user
  }
end

Given(/^that I have answered (\d+) of (\d+) questions correctly$/) do |num_correct, num_questions|
  num_questions.to_i.times do
    FactoryGirl.create :question, exercise: @exercise
  end
  num_correct.to_i.times do |n|
    question = @exercise.questions[n]
    correct_alternative = question.correct_alternatives.first
    FactoryGirl.create :answer, { alternative: correct_alternative, user: @user }
  end
end

Given(/^I am on the course page$/) do
  visit "/courses/#{@exercise.section.course.id}"
end

Then(/^my progress for that exercise should be "(.*?)"$/) do |percentage|
  page.should have_content(percentage)
end

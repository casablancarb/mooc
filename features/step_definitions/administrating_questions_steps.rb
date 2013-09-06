Given(/^I am logged in as a teacher$/) do
  @exercise = FactoryGirl.create :exercise
  @user = @exercise.section.course.user
  #@user = FactoryGirl.create :user
  @user.is_teacher = true
  @user.save!

  visit '/login'
  fill_in 'email', with: 'jane@example.com'
  fill_in 'password', with: '123123'
  click_button 'Log in'
  page.find(:css, '.alert').text.should include('Successfully logged in')
end

Given(/^I am on the page for one of my exercises$/) do
 # @exercise = FactoryGirl.create :exercise
 #  @exercise.section.course.user = @user
 #  @exercise.section.course.user_id = @user
 #  @exercise.save!
  visit "/admin/sections/#{@exercise.section.id}/exercises/#{@exercise.id}"
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

require 'factory_girl'

FactoryGirl.define do
  factory :user do
    firstname 'Jane'
    lastname 'Doe'
    email 'jane@example.com'
    password '123123'
    password_confirmation '123123'
  end

  factory :admission do
    user
    course
  end

  factory :course do
    title 'Philosophy and Programming'
    year 2013
    semester 1
    user
    admission_code{ (Course.count + 12).to_s }
  end

  factory :section do
    title 'Social skills in IT'
    description 'During this section we\'ll turn things around and practice our social skills'
    course
  end

  factory :exercise do
    title 'Practicing the art of deception'
    description 'This exercise will train you in the art of deception'
    video_id 'SOME_VIDEO_ID'
    published true
    section
  end

  factory :question do
    body 'What is the color of the color red?'
    exercise

    after :create do |question|
      question.alternatives << FactoryGirl.create(:correct_alternative, question: question)
      question.alternatives << FactoryGirl.create(:incorrect_alternative, question: question)
    end
  end

  factory :alternative do
    question

    factory :correct_alternative do
      body 'red'
      explanation 'It is simply illogical for A to be B if B is not A'
      truth_value false
    end

    factory :incorrect_alternative do
      body 'blue'
      explanation 'The reason red is red is that it\'s red'
      truth_value true
    end
  end
end

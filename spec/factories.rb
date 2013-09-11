require 'factory_girl'

FactoryGirl.define do
  factory :user do
    firstname 'Jane'
    lastname 'Doe'
    email 'jane@example.com'
    password '123123'
    password_confirmation '123123'

    factory :teacher do
      is_teacher true
    end
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

    factory :exercise_with_questions do
      after :create do |exercise|
        3.times do
          exercise.questions << FactoryGirl.create(:question)
        end
      end
    end
  end

  factory :question do
    body 'What is the color of the color red?'
    exercise

    after :create do |question|
      question.alternatives << FactoryGirl.create(:correct_alternative, question: question)
      question.alternatives << FactoryGirl.create(:incorrect_alternative, question: question)
    end
  end

  factory :answer do
    alternative
    user
  end

  factory :alternative do
    question

    factory :incorrect_alternative do
      body 'red'
      explanation 'It is simply illogical for A to be B if B is not A'
      truth_value false
    end

    factory :correct_alternative do
      body 'blue'
      explanation 'The reason red is red is that it\'s red'
      truth_value true
    end
  end

  factory :announcement do
    course
    title 'Public service announcement'
    body 'Will the real Slim Shady please stand up!'

    factory :invalid_announcement do
      course nil
      title nil
      body nil
    end
  end
end

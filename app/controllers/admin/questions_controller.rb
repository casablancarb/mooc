class Admin::QuestionsController < ApplicationController
  before_filter :set_exercise_instance_variable

  def new
    build_breadcrumb
  end

  private

  def set_exercise_instance_variable
    @exercise = Exercise.find params[:exercise_id]
  end

  def build_breadcrumb
    section = @exercise.section
    course = section.course.decorate
    @breadcrumbs = [
      Breadcrumb.new('My teaching', admin_courses_path),
      Breadcrumb.new("#{course.title}, #{course.decorate.when}", admin_course_path(course)),
      Breadcrumb.new(section.title, admin_course_section_path(course, section)),
      Breadcrumb.new(@exercise.title, admin_section_exercise_path(section, @exercise)),
      Breadcrumb.new("#{@question && @question.title || 'New question'}")
    ]
  end

end

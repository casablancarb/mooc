class ExercisesController < ApplicationController
  def show
    @exercise = Exercise.find(params[:id]).decorate

    @breadcrumbs = [
      Breadcrumb.new('My studies', studies_path),
      Breadcrumb.new(@exercise.section.course.title, course_path(@exercise.section.course)),
      Breadcrumb.new(@exercise.section.title, section_path(@exercise.section)),
      Breadcrumb.new(@exercise.title)
    ]
  end
end

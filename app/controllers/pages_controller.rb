class PagesController < ApplicationController
  skip_before_filter :authorize, only: :welcome

  def welcome
    redirect_to studies_path if current_user
  end

  def studies
    @courses = CourseDecorator.decorate_collection current_user.admitted_courses
  end
end

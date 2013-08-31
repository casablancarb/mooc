class SectionsController < ApplicationController
  def show
    @user = current_user
    @section = Section.find(params[:id]).decorate
    @breadcrumbs = [
      Breadcrumb.new('My studies', studies_path),
      Breadcrumb.new(@section.course.title, course_path(@section.course)),
      Breadcrumb.new(@section.title)
    ]
  end
end

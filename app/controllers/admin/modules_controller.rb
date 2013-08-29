class Admin::ModulesController < ApplicationController
  def new
    @module = Module.new
    @course = Course.find(params[:course_id]).decorate
    redirect_unless_write_access_to_course!(@course)
  end
end

class SectionsController < ApplicationController
  def show
    @section = Section.find(params[:id]).decorate
  end
end

class ProjectFrameworksController < ApplicationController
  
  def create
    project = Project.find_by_id params[:project_id]
    project.assign_frameworks params[:data]
    render :nothing => true
  end

end
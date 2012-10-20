class ProjectPostsController < ApplicationController
  
  def new
    @project = Project.find_by_id params[:project_id]
  end

end
class ProjectsController < ApplicationController
 
 def new
 	@project_name = params[:project_name]
 end

 def create
 	project_name = params[:project_name]
 	@project = Project.create project_name
	flash[:success] = "Created project #{project_name}"
 	redirect_to :action => :show, :id => @project.id
 end

 def show
 	id = params[:id]
  @project = Project.find_by_id id
  if @project == nil 
    not_found
  end
 end

end

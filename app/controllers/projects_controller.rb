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

 def assign_languages
   project = Project.find_by_id params[:project_id]
   project.assign_languages params[:data]
   render :nothing => true
 end

 def assign_frameworks
   project = Project.find_by_id params[:project_id]
   project.assign_frameworks params[:data]
   render :nothing => true
 end

 def assign_vcs
   project = Project.find_by_id params[:project_id]
   project.assign_vcs params[:data]
   render :nothing => true
 end

 def assign_ci
   project = Project.find_by_id params[:project_id]
   project.assign_ci params[:data]
   render :nothing => true
 end

 def assign_infrastructure_management_tools
   project = Project.find_by_id params[:project_id]
   project.assign_infrastructure_management_tools params[:data]
   render :nothing => true
 end

 def assign_build_tools
   project = Project.find_by_id params[:project_id]
   project.assign_build_tools params[:data]
   render :nothing => true
 end

end

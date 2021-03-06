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
   project.assign_languages params[:data].split(",")
   render :nothing => true
 end

 def assign_frameworks
   project = Project.find_by_id params[:project_id]
   project.assign_frameworks params[:data].split(",")
   render :nothing => true
 end

 def assign_vcs
   project = Project.find_by_id params[:project_id]
   project.assign_vcs params[:data].split(",")
   render :nothing => true
 end

 def assign_ci
   project = Project.find_by_id params[:project_id]
   project.assign_ci params[:data].split(",")
   render :nothing => true
 end

 def assign_infrastructure_management_tools
   project = Project.find_by_id params[:project_id]
   project.assign_infrastructure_management_tools params[:data].split(",")
   render :nothing => true
 end

 def assign_build_tools
   project = Project.find_by_id params[:project_id]
   project.assign_build_tools params[:data].split(",")
   render :nothing => true
 end

 def assign_operating_system
   project = Project.find_by_id params[:project_id]
   project.assign_operating_system params[:data].split(",")
   render :nothing => true
 end

 def assign_off_the_shelf_products
   project = Project.find_by_id params[:project_id]
   project.assign_off_the_shelf_products params[:data].split(",")
   render :nothing => true
 end

 def assign_cloud_usage
   project = Project.find_by_id params[:project_id]
   project.assign_cloud_usage params[:data].split(",")
   render :nothing => true
 end

 def assign_databases
   project = Project.find_by_id params[:project_id]
   project.assign_databases params[:data].split(",")
   render :nothing => true
 end

end

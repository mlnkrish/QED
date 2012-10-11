class ProjectsController < ApplicationController
 
 def new
 	@project_name = params[:project_name]
 end

 def create
 	project_name = params[:project_name]
 	@project = nil
 	begin
 		@project = Project.create project_name
 	rescue Exceptions::EntityExists => e
 		flash[:error] = "The project with this name alredy exists"
		redirect_to :action => :new, :project_name => project_name 
		return	
	end	
	flash[:success] = "Created project #{project_name}"
 	redirect_to :action => :edit, :id => @project.id
 end

 def edit
 end

end

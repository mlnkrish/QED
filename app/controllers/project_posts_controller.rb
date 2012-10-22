class ProjectPostsController < ApplicationController
  
  def new
    @project = Project.find_by_id params[:project_id]
    @post = Post.new({})
  end

  def create
    post = Post.create params[:title],params[:post_text],params[:post_tags].split(","),params[:project_id]
    redirect_to :controller=>"posts", :action => :show, :id => post.id
  end

end
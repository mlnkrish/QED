class PostsController < ApplicationController

  def show
    id = params[:id]
    @post = Post.find_by_id id
  end

  def edit
    id = params[:id]
    @post = Post.find_by_id id
  end

  def update
    id = params[:id]
    @post = Post.find_by_id id
    @post.update params[:title],params[:post_text],params[:post_tags].split(",")
    redirect_to :action=>"show", :id => @post.id
  end

end
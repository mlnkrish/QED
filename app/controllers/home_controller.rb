class HomeController < ApplicationController
  
  def index
    @all_projects = Project.find_all
  end
end
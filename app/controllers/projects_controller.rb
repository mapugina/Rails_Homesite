class ProjectsController < ApplicationController
  respond_to :json
  
  def index
    
    #gather all projects
    projects = Project.all
    
    #respond to request with post data in json format
    respond_with(projects) do |format|
      format.json { render :json => projects.as_json }
    end
    
  end
  

  def create
    
    new_project = Project.new
    new_project.title = params[:title][0...250]
    new_project.contents = params[:contents]
    
    if new_project.valid?
      new_project.save!
    else
      render "public/422", :status => 422
      return
    end
    
    respond_with(new_project) do |format|
      format.json { render :json => new_project.as_json }
    end
    
   end
      
end
